# INSA - Typst Template
Typst Template for documents from the french engineering school INSA.

## Examples
You can find examples for the 3 document types [in the `exemples` folder](exemples).

## Usage
1. Download the code from GitHub. To do that, click on the green "Code" button and then "Download ZIP".  
    ![illustration](illustrations/github-download.png)
1. Open the ZIP archive file and copy the `insa-template` folder in the directory with your Typst project.
1. (*OPTIONAL*) If you are using the Typst web application, you have to first *create* the `insa-template` folder by clicking on the little folder button in the "Files" panel.  
    ![illustration](illustrations/typst-folder.png)
1. (*OPTIONAL*) After creating the folder, simply drag all the files you downloaded in it (`template.typ, cover.jpg, footer.png, logo.png`).
1. Add this line at the beginning of your Typst file (by default, `main.typ`):
    ```typst
    #import "insa-template/template.typ" : *
    ```
1. Choose between the 3 available templates: `insa`, `insa-short` or `insa-report`.
1. Copy the `#show` rule from the example document of the template you chose to your Typst file. In example:
    ```typst
    #show: doc => insa-short(
      author: [
        Youenn LE JEUNE\
        3 INFO G2.1
      ],
      doc
    )
    ````
1. Enjoy!

## Platforms
The template can be used in the web Typst editor *and* in a local environment.

I personnally prefer to use it in Visual Studio Code with the `Typst LSP` And `Typst Preview` extensions.

You can also directly edit your Typst files with a simple text editor and compile it with the Typst CLI.
See [Installation](https://github.com/typst/typst?tab=readme-ov-file#installation) and [Usage](https://github.com/typst/typst?tab=readme-ov-file#usage) sections on the official Typst repository.