from jinja2 import Environment

# Read source.pl into a string
with open("source.pl", "r") as f:
    source = f.read()

# Create a Jinja2 environment with the template string
env = Environment()
template = env.from_string(source)

# Render the template without any variables
rendered = template.render()

# Write the rendered template to a file
with open("rendered.pl", "w") as f:
    f.write(rendered)
