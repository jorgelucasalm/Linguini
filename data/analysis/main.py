import streamlit as st
import numpy as np
import pandas as pd
from dataset import *
# dt = np.random.randn(10,20)
dt = pd.read_csv("food_recipes", )
st.title('Teste')
st.dataframe(food_recipes.csv)