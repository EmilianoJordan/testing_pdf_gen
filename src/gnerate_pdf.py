from jinja2 import Environment, PackageLoader, select_autoescape
from weasyprint import CSS, HTML

env = Environment(
    loader=PackageLoader("src"),
    autoescape=select_autoescape()
)
template = env.get_template("index.html")
html = HTML(string=template.render())
pdf = html.write_pdf("output/index.pdf", stylesheets=[CSS("src/css/pdf.css")])
