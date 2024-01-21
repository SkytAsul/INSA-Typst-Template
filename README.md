# INSA - Typst Template
Typst Template for documents from the french engineering school INSA.

## Usage
1. Copy the `insa-template` folder in the folder with your Typst project.
2. Add this line at the beginning of your Typst file:
```typst
#import "insa-template/template.typ" : *
```
3. Choose between the 3 available templates: `insa`, `insa-short` or `compte-rendu`.
4. Copy the `#show` rule from the example document of the template you chose to your Typst file.
5. Enjoy!

## Platforms
The template can be used in the web Typst editor *and* in a local environment.

I personnally prefer to use it in Visual Studio Code with the `Typst LSP` And `Typst Preview` extensions.

You can also directly edit your Typst files with a simple text editor and compile it with the Typst CLI.
See [Installation](https://github.com/typst/typst?tab=readme-ov-file#installation) and [Usage](https://github.com/typst/typst?tab=readme-ov-file#usage) sections on the official Typst repository.