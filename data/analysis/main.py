import streamlit as st
import numpy as np
import pandas as pd
from dataset import *

dt = pd.read_csv("food_recipes.csv", ',') 
st.title('Teste')
st.dataframe(dt)