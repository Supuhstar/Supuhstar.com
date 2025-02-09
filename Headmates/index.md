---
layout: page
title: Headmates
date: 2025-02-04 MT

navigation-back: false

page-specific-stylesheets:
    - /styles/headmates.css
---


<section class="flex-row flex-wrap flex-vert-top flex-horiz-center">
{% for headmate in site.data.headmates.headmates %}
{% include headmates/card.html
    headmate=headmate
%}
{% endfor %}
</section>
