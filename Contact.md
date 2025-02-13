---
layout: about
title: Contact
app-bar:
    title: DMs open!
excludeAutoH1: true

page-specific-stylesheets:
    - /styles/about.css
---

We're an integrated (formerly-DID) system with {{ site.data.headmates.headmates | size }}+ headmates.

We're a plural system, meaning there's just one body and many people within it.

<aside>It's okay to ask to talk to a specific headmate! Worst case, We say "not right now"</aside>


## Identity shit

Our body's name is **Ky**.


### Pronouns

Our individual 3rd-person pronouns (like them/she/him) are **different per alter** because each of Us has a different gender<!-- (see also [[System Diagrams]]) -->.

When We talk about Ourself (collective 1st-person pronouns), We use **We/Us/Our/Ours/Ourself**.
Note that **We always capitalize these when referring Ourself**, just like you capitalize “I”. We do this to differentiate Ourself from the groups We're in. (e.g. “At the meet last night, We agreed to play our normal game, because we forgot to bring Our special one”)

You can collectively refer to Us in 3rd-person as **e/er/ers/em/emself or they/them**. For 2nd-person, **y'all/y'all's**, please.

<aside>Capitalized They/Them and Y'all/Y'all's is also okay, matching how We capitalize We/Us.</aside>



## Religions & Spiritualities

Most of Us are Anarcho-Christian. [Elijah](/Headmates#Elijah) & [Mendo](/Headmates#Mendo) consider themselves to be direct Servants of God.

Most of Us also practive & believe in a mysticism which has no name (it's a spirituality specific to Ourself, similar to Animism, Tai Chi, Buddhism...).

A few of Us are also Wiccan.

The Harmony System ([Blaze](/Headmates#Blaze) & [Aurora Flare](/Headmates#Aurora%20Flare)) worship Celestia & Luna.


## Contact info

{%- if site.social.default-username %}
Generally, you can find Us as **{{ site.social.default-username }}** in most places.
{%- endif %}



<section class="contact-cards   flex-row flex-wrap flex-horiz-center">
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
