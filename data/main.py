import os, io
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

import seaborn as sns  # visualization tool
import matplotlib
import matplotlib.pyplot as plt
import missingno as msno
import streamlit as st


st.title('Food Recipes Dataset Exploratory Data Analysis')
st.header('Metodologia')
st.text('\n1. Exploração dos dados\n2. Limpeza dos dados\n3. Análise das variáveis categóricas \n4. Análise descriptiva \n5. Visualização')

st.set_option('deprecation.showPyplotGlobalUse', False)

tab1, tab2, tab3, tab4, tab5 = st.tabs(["Exploração dos dados", "Limpeza dos dados", "Análise das variáveis categóricas", "Análise descriptiva", "Visualização"])
with tab1:
    st.header('1. Exploração dos dados')
    df = pd.read_csv("data/dataset.csv", ",")
    st.dataframe(df.head())

    st.subheader('Análises do tipo das variáveis')
    st.text(df.columns)
    st.text('recipe_title\nurl \nrecord_health \nvote_count \nrating \ndescription \ncuisine \ncourse \ndiet \nprep_time \ncook_time \ningredients \ninstructions \nauthor \ntags \ncategory')

    st.subheader('Informação das features presentes no conjunto de trenamento')
    col1, col2 = st.columns(2)
    with col2:
        buffer = io.StringIO()
        df.info(buf=buffer)
        s = buffer.getvalue()
        st.text(s)


with tab2:
    st.header('2. Limpeza dos dados')
    st.subheader("Análise do quantitativo de valores ausentes no dataset")
    matrix = msno.matrix(df)
    st.text(matrix)
    st.pyplot()

    # bar = msno.bar(df)
    # st.text(bar)
    # st.pyplot()

    st.line_chart((df.isna().sum()))

    heat = msno.heatmap(df)
    st.text(heat)
    st.pyplot()

    dendo = msno.dendrogram(df)
    st.text(dendo)
    st.pyplot()

    cols_with_missing = [col for col in df.columns if df[col].isnull().any()]
    # st.text(f"""{cols_with_missing}""")

    st.subheader("Formatação dos dados")
    df = df.dropna(subset=['ingredients','instructions'])

    df['ingredients'] = df['ingredients'].apply(lambda x: x.split('|'))
    df['instructions'] = df['instructions'].apply(lambda x: x.replace('|',''))
    df['tags'] = df['tags'].apply(lambda x: x.split('|') if type(x)!= float else x)
    df['prep_time']=df['prep_time'].apply(lambda x: int(x.replace('M', '')) if type(x)!= float else x)
    df['cook_time'] = df['cook_time'].apply(lambda x: int(x.replace('M', '')) if type(x)!= float else x)
    col1, col2 = st.columns(2)
    with col1: 
        st.text((df.isna().sum()))
    with col2:
        st.line_chart((df.isna().sum()))




# with tab3:

