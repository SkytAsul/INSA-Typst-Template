![Dynamic JSON Badge](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fpackages.typst.org%2Fpreview%2Findex.json&query=%24%5B%3F(%40.name%3D%3D%22silky-report-insa%22)%5D.version&style=for-the-badge&label=Report%20Version&color=red)

# INSA - Typst Template
Typst Template for documents from the french engineering school INSA.

## Examples
You can find examples for the 3 document types [in the `exemples` folder](exemples).

## Usage
### From online package
The "report" template is available in the official Typst templates repository (Typst Universe). [(see here)](https://typst.app/universe/template/silky-report-insa)
There are multiple ways to use it:
- From the [Typst web application](https://typst.app/), click on the "Start from template" button and search for "silky-report-insa" in the list. Click on it, select a name, and click on "Create". Voilà!
- If you want to initialize a new project through the CLI, use
    ```sh
    $ typst init @preview/silky-report-insa:<version>
    ```
  (replace `<version>` by the latest version available, see at the top)
- If you want to add it to an existing project, copy the `#show` rule from an example [in the `exemples` folder](exemples) *but* replace the `import` by this line:
    ```typst
    #import "@preview/silky-report-insa:<version>": *
    ```
    (replace `<version>` by the latest version available, see at the top)

### From sources (editable version)
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
1. Choose between the 3 available templates: `insa-full`, `insa-short` or `insa-report`.
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