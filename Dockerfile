FROM jupyter/all-spark-notebook:latest as build
RUN pip install PyQt5 && \
pip install ipysheet && \
pip install plotly && \
git clone https://github.com/timkpaine/lantern && \
cd lantern && \
make install && \
pip install pylantern && \
jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
jupyter labextension install plotlywidget && \
jupyter labextension install @jupyterlab/plotly-extension && \
jupyter labextension install jupyterlab_bokeh && \
jupyter labextension install qgrid && \
jupyter labextension install @jpmorganchase/perspective-jupyterlab && \
jupyter labextension install ipysheet && \
jupyter labextension install bqplot && \
jupyter serverextension enable --py lantern && \
jupyter labextension install jupyterlab_voyager 

FROM jupyter/all-spark-notebook:latest

COPY --from=build "/opt/conda/share/jupyter/lab" "/opt/conda/share/jupyter/lab"
