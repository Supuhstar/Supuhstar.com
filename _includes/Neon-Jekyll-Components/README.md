# Neon Jekyll Components #
Some Liquid components which can be used in Jekyll, for use in the Neon theme system.



# Dependencies #

This repo only contains renderers for HTML code. As such, it assumes you will be using [the Neon stylesheet system](https://github.com/BlueHuskyStudios/stylesheets) to render these components. This can be utilized simply by importing the following as normal CSS stylesheets:

- **Flex**:           https://Stylesheets.BHStudios.org/assets/v2/structure/flex.css
- **Neon Tables**:    https://Stylesheets.BHStudios.org/assets/v2/neon/neon-tables.css
- **Neon Renderer**:  https://Stylesheets.BHStudios.org/assets/v2/neon/neon-renderer.css

- A Neon theme stylesheet, such as these:
    - **Neon Water**: https://Stylesheets.BHStudios.org/assets/v2/neon/neon-water.css
    - **Neon Earth**: https://Stylesheets.BHStudios.org/assets/v2/neon/neon-earth.css
    - **Neon Fire**:  https://Stylesheets.BHStudios.org/assets/v2/neon/neon-fire.css
    - **Neon Air**:   https://Stylesheets.BHStudios.org/assets/v2/neon/neon-air.css

- **Material Icons**: https://fonts.googleapis.com/icon?family=Material+Icons


Additionally, these are recommended:

- **Print**: https://Stylesheets.BHStudios.org/assets/v2/basics/print.css
- **Some Google fonts:** https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700|Questrial|ZCOOL+QingKe+HuangYou|Oswald:600&amp;subset=chinese-simplified,korean,latin-ext,vietnamese,cyrillic,cyrillic-ext,greek,greek-ext



Of course, if you prefer, you can use any stylesheet you want, including making your own.



# Components #

This repo contains the following components, usable as Jekyll/Liquid includes. The documentation below uses some symbols to help it remain compact:

- 👇🏽 - The argument can be placed directly in the include's arguments
- 📄 - The argument can be specified in the page's front-matter
- 🌐 - The argument can be specified in the site's config

This is also the precedence order: The top items in this list take precedence over following ones. If two or more are specified, the highest one is used.



## App Bar ##
`App-Bar/app-bar.html`
The app bar is modeled after [the Material app bar (Top)](https://material.io/components/app-bars-top).


### Arguments ###

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> 👇🏽📄 `title` </td><td> The text shown in the app bar as the page title </td>
    <td>

- Any string: The given string is blindly placed in the app bar

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽📄 `navigation-back` </td><td>Whether to provide a "Back" button in the app bar. This can be specified in the page front matter, or as an include argument. If both are specified, the include argument take precedence. </td>
    <td>

- Excluded or `false`: A "Sidebar" button appears instead
- `true`:              A back button appears in place of the sidebar button, using JavaScript
                       to navigate back. If JavaScript is disabled, this navigates to the site
                       root ("`/`")
- Any string:          A back button appears which navigates to the given string, blindly
                       placing it in the `href` field.

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽📄 `subtitle` </td><td>A subtitle to show in the app bar </td>
    <td>

- Excluded or `false`: No subtitle appears
- Any string:          The given string is blindly placed in the app bar next to the title

    </td>
</tr>
</tbody>
</table>



## Sidebar ##
`Sidebar/sidebar.html`
The sidebar is modeled after [the Material navigation Drawer](https://material.io/components/navigation-drawer)

All site config variants to these must be nested under a `sidebar` YML object, like this:

```yml
sidebar:
    headerImage:
        url: https://example.com/sidebar-header.png
        htmlClassNames: "greyscale square"
```


### Arguments ###

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> _optional_ <hr/> 👇🏽🌐 `emptyHeader` </td><td> Whether to leave the header of the sidebar empty (no image). If specified via the site config, then it must be nested as `sidebar.emptyHeader`. If not specified, then `headerImage_url` must be specified (see below). </td>
    <td>

- Excluded or `false`: The header image is displayed, or an error message if none was specified
- `true`:              The header image is not displayed at all

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `headerImage_url` <br/> 🌐 `headerImage.url` </td><td> The URL to the image to display in the sidebar's header. If excluded, then `emptyHeader` must be specified.</td>
    <td>
- Excluded or `false`: The header image is not displayed. If `emptyHeader` is not `true`, then an error message is displayed instead.
- Any string:          The URL to the header image

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `headerImage_htmlClassNames` <br/> 🌐 `headerImage.htmlClassNames` </td><td> Any classnames to place in the `class` attribute of the HTML element representing the header image.</td>
    <td>

- Excluded or `false`: No additional classname is applied to the HTML element representing the header image
- Any string:          The given string is blindly inserted into the HTML element's `class` attribute

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽🌐 `excludeHomepageLink` </td><td> Whether to exclude the homepage link from the sidebar. </td>
    <td>

- Excluded or `false`: The link will appear. When the user is on the homepage (`/`), this link still appears but is disabled
- `true`:              The link is not displayed at all

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽🌐 `excludeAboutLink` </td><td> Whether to exclude the about page link from the sidebar. The name of the about page is specified in the site config as `pages.about`; if that's not specified, it's assumed to be `about`, with the path `/about/`. </td>
    <td>

- Excluded or `false`: The link will appear. When the user is on the about (e.g. `/about/`), this link still appears but is disabled
- `true`:              The link is not displayed at all

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `links` </td><td> Page-specific links to place in the sidebar </td>
    <td>

- Excluded or `false`: Only site-wide links are placed in the sidebar
- Array of objects:    The links to place in the sidebar beneath the site-wide links. Here are the object fields:
    - `url`: The URL to which the link directs. Can be a `javascript:` URL
    - `materialIcon` or `fontAwesomeIcon`: _optional_ - The icon to use next to the link text
    - `text`: The text to display in the link

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `additionalSectionIncludes` </td><td> Any additional sections to place below the links in the sidebar.
    <td>

- Excluded or `false`: No additional sections are placed in the sidebar
- Array of strings:    Paths to any liquid files to `{% include %}` in the sidebar

    </td>
</tr>
</tbody>
</table>



## Jump Pills ##
`Jump-Pills/jump-pills.html`
A collection of pill-shaped buttons which serve to allow the user to jump to different parts of the page.


### Arguments ###

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> 👇🏽 `ids` </td><td> The `id`s of elements on the page </td>
    <td>

- Array of objects: An array containing the ID and text for each jump pill. Here are the object fields:
    - `id`: The ID of the page element which this pill jumps to
    - `title`: The text to place in the pill

    </td>
</tr>
</tbody>
</table>



## Galleries ##
Some image galleries

### Thumbnails ##
`Galleries/thumbnails-gallery.html`
A grid of thumbnail images and a caption

#### Arguments ####

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> 👇🏽 `images` </td><td> The images to display in the gallery </td>
    <td>

- Array of objects: The images to show in the gallery. Here are the object fields:
    - `thumb`: _optional_ - The URL to a small version of the image, to show the user in this gallery before they've selected it. If excluded, the `full`-size image is resized to work as the thumbnail, after being sent to the user in full.
    - `full`:  The URL to the full version of the image, which will be shown if the user selects the thumbnail
    - `alt`:   _optional_ - Metadata text to include with the image, which will be shown if the thumbnail fails to render for any reason, and which will be read by screen readers.

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `caption` </td><td> The text to display at the bottom of the gallery </td>
    <td>

- Excluded or `false`: No caption is placed in the gallery
- Any string:          The given text is be placed at the bottom of the gallery

    </td>
</tr>
</tbody>
</table>

### Single-Item Highlight ##
`Galleries/single-item-highlight.html`
A "gallery" which only highlights one single item.

#### Arguments ####

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> 👇🏽 `full` </td><td> The URL to the full-size version of the item </td>
    <td>

- Excluded or `false`: The gallery is rendered "flat" - it has no effect to indicate it has higher priority than other galleries
- `true`:              The gallery is rendered as "raised" - it has an effect applied to indicate it has a higher priority than other galleries.

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `thumb` </td><td> The URL to a small version of the image, to show the user in this gallery before they've selected it </td>
    <td>

- Excluded or `false`: The `full`-size image is resized to work as the thumbnail, after being sent to the user in full.
- Any string:          The given text is used as a URL to a small version of the image, to show the user in this gallery before they've selected it

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `alt` </td><td> Metadata text to include with the image, which will be shown if the thumbnail fails to render for any reason, and which will be read by screen readers. </td>
    <td>

- Excluded or `false`: The image has no alt text metadata
- Any string:          The given text is used as the image's alt text

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `caption` </td><td> The text to display at the bottom of the gallery </td>
    <td>

- Excluded or `false`: No caption is placed in the gallery
- Any string:          The given text is be placed at the bottom of the gallery

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `small` </td><td> Whether to render the gallery smaller than normal. <hr/> This relies on an external CSS stylesheet to render galleries with the `small` class differently than others. </td>
    <td>

- Excluded or `false`: The gallery is rendered in its normal size
- `true`:              The gallery is rendered smaller than normal

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `raised` </td><td> Whether to render the gallery as a raised or flat card. <hr/> This relies on an external CSS stylesheet to render galleries with the `raised` class differently than others. </td>
    <td>

- Excluded or `false`: The gallery is rendered "flat" - it has no effect to indicate it has higher priority than other galleries
- `true`:              The gallery is rendered as "raised" - it has an effect applied to indicate it has a higher priority than other galleries.

    </td>
</tr>
<tr>
    <td> _optional_ <hr/> 👇🏽 `float` </td><td> Whether the gallery should [float](https://developer.mozilla.org/en-US/docs/Web/CSS/float) in the page flow. <hr/> This relies on an external CSS stylesheet to render galleries with the `left` and `right` classes differently than others. </td>
    <td>

- Excluded, blank, or `false`: The gallery is not floated
- `left`:                      The gallery is floated to the left
- `right`:                     The gallery is floated to the right

    </td>
</tr>
</tbody>
</table>


### Single-Item Highlight (Custom) ##
`Galleries/single-item-highlight-custom-start.html` and `Galleries/single-item-highlight-custom-end.html`
A "gallery" which only highlights one single item, and allows you to place anything at all in the gallery (for example, [a YouTube video](https://recipes.kyleggiero.me/Fried-Chicken/#ytplayer-assemblyLine)).

This requires you include the `start`, then place your custom content, then include the `end`.

#### Arguments for `start` ####

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> _optional_ <hr/> 👇🏽 `raised` </td><td> Whether to render the gallery as a raised or flat card. <hr/> This relies on an external CSS stylesheet to render galleries with the `raised` class differently than others. </td>
    <td>

- Excluded or `false`: The gallery is rendered "flat" - it has no effect to indicate it has higher priority than other galleries
- `true`:              The gallery is rendered as "raised" - it has an effect applied to indicate it has a higher priority than other galleries.

    </td>
</tr>
</tbody>
</table>

#### Arguments for `end` ####

<table>
<thead><tr><th> Argument </th><th> Description </th><th> Allowed values </th></tr></thead>
<tbody>
<tr>
    <td> _optional_ <hr/> 👇🏽 `caption` </td><td> The text to display at the bottom of the gallery </td>
    <td>

- Excluded or `false`: No caption is placed in the gallery
- Any string:          The given text is be placed at the bottom of the gallery

    </td>
</tr>
</tbody>
</table>
