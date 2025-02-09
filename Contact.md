---
layout: page
title: Contact
app-bar:
    title: DMs open!


page-specific-stylesheets:
    - /styles/contact.css
---



{%- if site.social.default-username %}
Generally, you can find Us as **{{ site.social.default-username }}** in most places.
{%- endif %}



<section class="contact-cards   flex-row flex-wrap">
{%- if site.social.bsky %}

{%- assign bskyHref = "https://bsky.app/profile/" | append: site.social.bsky %}

{% include social/user-card.html
    service-name="B. Sky"
    username=site.social.bsky
    href=bskyHref
%}
{%- endif %}



{%- if site.social.telegram %}

{%- assign tgHref = "https://t.me/" | append: site.social.telegram %}

{% include social/user-card.html
    service-name="Telegram"
    username=site.social.telegram
    href=tgHref
%}
{%- endif %}



{%- if site.social.github %}

{%- assign ghHref = "https://github.com/" | append: site.social.github %}

{% include social/user-card.html
    service-name="GitHub"
    username=site.social.github
    href=ghHref
    omit-at-sign-in-username=true
%}
{%- endif %}



{%- if site.social.email %}

{%- assign eHref = "mailto:" | append: site.social.email %}

{% include social/user-card.html
    service-name="eMail"
    username=site.social.email
    href=eHref
    omit-at-sign-in-username=true
%}
{%- endif %}
</section>
