import os, io
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

import seaborn as sns  # visualization tool
import matplotlib
import matplotlib.pyplot as plt
import missingno as msno
import streamlit as st


st.title('Food Recipes Dataset Exploratory Data Analysis')

tab1, tab2, tab3 = st.tabs(["Exploração dos dados", "Limpeza dos dados", "Visualização"])
with tab1:
    st.header('1. Exploração dos dados')
    df = pd.read_csv("data/dataset.csv", ",")
    st.dataframe(df.head())
    st.dataframe(df.tail())
    st.subheader('1.1. Análises do tipo das variáveis')
    st.text(df.columns)
    st.write('''
    1. recipe_title: Variável categórica nominal, informa os títulos das receitas. 
    2. URL: Variável categórica nominal, informa o link de no qual foi obtido as informações da receita
    3. record_health: Coluna cujo a interpretação é confusa, pois só possui um único valor categórico. 
    4. vote_count: Variável numérica discreta, contabiliza a quantidade de votos de uma receita. 
    5. rating: Variável numérica contínua, informa a avaliação da receita pelo público. 
    6. description: Variável categórica nominal, se trata de uma breve descrição da receita. 
    7. cuisine: Variável categórica ordinal, informa a cozinha regional da receita. 
    8. course: Variável categórica ordinal, informa o tipo do prato. 
    9. diet: Variável categórica ordinal, informa qual dieta engloba a receita. 
    10. prep_time: Variável numérica contínua, informa o tempo de preparação da receita. 
    11. cook_time: Variável numérica contínua, informa o tempo de cozimento da receita.
    12. ingredients: Variável categórica nominal, informa os ingredientes presentes na receita, mas não informa quantidade. 
    13. instructions: Variável categórica nominal, armazena a instrução de preparo da receita. 
    14. author: Variável categórica nominal, armazena o nome do autor. 
    15. tags: Variável categórica ordinal, armazena as tags da receita. 
    16. category: Variável categórica ordinal, armazena a categoria da receita. 
    ''')
    # st.text('recipe_title\nurl \nrecord_health \nvote_count \nrating \ndescription \ncuisine \ncourse \ndiet \nprep_time \ncook_time \ningredients \ninstructions \nauthor \ntags \ncategory')

    st.subheader('1.2. Visualização dos dados')
    col1, col2 = st.columns(2)
    with col1:
        st.text((df.isna().sum()))
    with col2:
        buffer = io.StringIO()
        df.info(buf=buffer)
        s = buffer.getvalue()
        st.text(s)
    sns.set_style('dark')
    sns.set_theme(color_codes=True)

    st.line_chart((df.isna().sum()))

    col1, col2 = st.columns(2)
    with col1: 
        graph = sns.countplot(x = df['record_health']); #this column must be dropped
        st.text(graph)
        st.pyplot();
    with col2:
        h = sns.histplot(x = 'diet',data = df, bins = 20);
        plt.xticks(rotation=90);
        plt.tight_layout()
        st.text(h)
        st.pyplot()
with tab2:
    st.header('2. Limpeza dos dados')
    st.subheader("2.1. Visualização dos dados")
    matrix = msno.matrix(df)
    st.text(matrix)
    st.pyplot();

    # bar = msno.bar(df)
    # st.text(bar)
    # st.pyplot()

    # heat = msno.heatmap(df)
    # st.text(heat)
    # st.pyplot()

    # dendo = msno.dendrogram(df)
    # st.text(dendo)
    # st.pyplot()
    st.dataframe(df.head(3))

    cols_with_missing = [col for col in df.columns if df[col].isnull().any()]
    # st.text(f"""{cols_with_missing}""")
    st.subheader("2.2. Exclusão de linhas e colunas")
    st.write("Excluir receitas duplicatas e linhas com valores nulos nas colunas de ingredientes, instruções, título de receita e dieta.")
    df = df.dropna(subset=['ingredients','instructions', 'recipe_title', 'diet'])
    df = df.drop(['url', 'record_health'], axis=1)
    st.text(df.columns)
    st.dataframe(df.head(3))

    st.subheader("2.3. Tratamento do tipo das variáveis")
    st.write('''
    - Alterar o tipo das variáveis nas colunas de tempo de preparação e tempo de cozimento;
    - Transformar strings nas colunas de ingredientes e tags para listas com várias strings;
    - Formatação dos dados da coluna de instrução;
    ''')

    df['ingredients'] = df['ingredients'].apply(lambda x: x.split('|'))
    df['instructions'] = df['instructions'].apply(lambda x: x.replace('|',''))
    df['tags'] = df['tags'].apply(lambda x: x.split('|') if type(x)!= float else x)
    df['prep_time']=df['prep_time'].apply(lambda x: int(x.replace('M', '')) if type(x)!= float else x)
    df['cook_time'] = df['cook_time'].apply(lambda x: int(x.replace('M', '')) if type(x)!= float else x)

    st.dataframe(df[['ingredients', 'instructions', 'tags', 'prep_time', 'cook_time']])
    st.subheader("2.4. Tratamento de valores ausentes")

    df['cook_time'].fillna(df['cook_time'].mean(), inplace = True)
    df['prep_time'].fillna(df['prep_time'].mean(), inplace = True)

    st.line_chart((df.isna().sum()))

with tab3:
    st.header('3. Visualização geral dos dados')

    # f, ax = plt.subplots(figsize=(5, 5))
    h = sns.countplot(x = 'course',data = df, order = df['course'].value_counts().index);
    # plt.xticks(rotation=90);
    # plt.tight_layout()
    st.text(h);
    st.pyplot();

    df_cuisine = df[df['cuisine'].notnull()]
    f, ax = plt.subplots(figsize=(12, 14))
    h = sns.histplot(y = 'cuisine', data = df_cuisine);
    plt.xticks(rotation=90);
    plt.tight_layout()
    st.text(h);
    st.pyplot();

    df_diet = df[df['diet'].notnull()]
    f, ax = plt.subplots(figsize=(10, 9))
    h = sns.histplot(x = 'diet',data = df_diet, bins=20, hue = 'course');
    plt.xticks(rotation=90);
    plt.tight_layout()
    st.text(h);
    st.pyplot();

    nxn = sns.scatterplot(data=df_diet,x = 'cook_time', y="prep_time")
    plt.tight_layout();
    st.text(nxn);
    st.pyplot();

    h = plt.hist(df['prep_time'], range= (0, 1200));
    # plt.title("Tempo de preparação x Quantidade de receitas");
    # plt.xlabel("Tempo de preparação");
    # plt.ylabel("Frequência");
    st.text(h);
    st.pyplot();

    graph = sns.histplot(df['rating'], discrete=True);
    st.text(graph);
    st.pyplot();

    graph = sns.regplot(df['prep_time'], df['rating']);
    st.text(graph);
    st.pyplot();

    graph = sns.regplot(df['cook_time'], df['rating']);
    st.text(graph);
    st.pyplot();

    sns.set_theme(style="ticks", palette="pastel")
    graph = df[df['diet'].notnull()]
    nxn = sns.boxplot(data = graph, y = 'diet', x = 'rating', palette = ['m', 'g'])
    sns.despine(offset=10, trim= True)
    st.text(nxn);
    st.pyplot();


st.set_option('deprecation.showPyplotGlobalUse', False)
