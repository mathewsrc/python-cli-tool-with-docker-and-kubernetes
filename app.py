import click

@click.group(chain=True)
def cli():
    click.echo("Running")
    
@cli.command("split")
def split():
    click.echo("Spliting")
    
@cli.command("train")
def train():
    click.echo("Training")
    
@cli.command("test")
def test():
    click.echo("Evaluating")

if __name__ == "__main__":
    cli()