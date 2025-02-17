---
layout: page
title: Headmates
date: 2025-02-04 MT

navigation-back: false

page-specific-stylesheets:
    - /styles/headmates.css
---


Headmates are people who exist separately but share the same head/body. Aside from that shared home, they differ in every way a person could differ from another.


{%- if site.data.headmates.groups and site.data.headmates.groups[0] %}
    {%- for group in site.data.headmates.groups %}
        {%- if group.parent-group %}
            {%- assign __isSubgroup = true %}
        {%- else %}
            {%- assign __isSubgroup = false %}
        {%- endif %}
        
        {%- if __isSubgroup %}
            {%- assign __headingLevel = 2 %}
        {%- else %}
            {%- assign __headingLevel = 1 %}
        {%- endif %}
<h{{__headingLevel}}>{{ group.name | default: group.uuid | default: "Unnamed Group" }}</h{{__headingLevel}}>

        {%- for line in group.description-markdown %}
<p markdown="1">{{ line }}</p>
        {%- endfor %}

<section class="flex-row flex-wrap flex-vert-top flex-horiz-center">
    {%- comment %}
    <!-- Group:
    {{ group | jsonify }}
    -->
    {%- endcomment %}
        {%- for headmate in site.data.headmates.headmates %}
    {%- comment %}<!-- {{ headmate.name }}:
            {{ headmate | jsonify }}{%- endcomment %}
            {%- assign __thisHeadmateGroupId = headmate.group-id | default: headmate.supersystem-id %}
            {%- comment %}__thisHeadmateGroupId {{ __thisHeadmateGroupId | jsonify }}{%- endcomment %}
            
            {%- comment %}belongsToThisGroup:        
                __thisHeadmateGroupId == group.uuid
                {{ __thisHeadmateGroupId | jsonify }} == {{ group.uuid | jsonify }}{%- endcomment %}
                {%- if __thisHeadmateGroupId == group.uuid %}
                    {%- assign belongsToThisGroup = true %}
                {%- else %}
                    {%- assign belongsToThisGroup = false %}
                {%- endif %}
                {%- comment %}{{ belongsToThisGroup | jsonify }}{%- endcomment %}
                
            {%- comment %}belongsToThisDefaultGroup:
                (group.default and __thisHeadmateGroupId == null){%- endcomment %}
                {%- if __thisHeadmateGroupId == null %}
                    {%- assign __tmp = true %}
                {%- else %}
                    {%- assign __tmp = false %}
                {%- endif %}
                {%- comment %}{{ group.default | jsonify }} and {{ __tmp | jsonify }}{%- endcomment %}
                {%- if group.default and __tmp %}
                    {%- assign belongsToThisDefaultGroup = true %}
                {%- else %}
                    {%- assign belongsToThisDefaultGroup = false %}
                {%- endif %}
                {%- comment %}{{ belongsToThisDefaultGroup | jsonify }}{%- endcomment %}
                
            {%- comment %}shouldShow:
                belongsToThisGroup or belongsToThisDefaultGroup
                {{ belongsToThisGroup | jsonify }} or {{ belongsToThisDefaultGroup | jsonify }}{%- endcomment %}
                {%- if belongsToThisGroup or belongsToThisDefaultGroup %}
                    {%- assign shouldShow = true %}
                {%- else %}
                    {%- assign shouldShow = false %}
                {%- endif %}
                {%- comment %}{{ shouldShow | jsonify }}
            -->{%- endcomment %}
            {%- if shouldShow %}
                {%- include headmates/card.html
                    headmate=headmate
                %}
            {%- endif %}
        {%- endfor %}
</section>
    {%- endfor %}
{%- else %}
<section class="flex-row flex-wrap flex-vert-top flex-horiz-center">
{%- for headmate in site.data.headmates.headmates %}
{%- include headmates/card.html
    headmate=headmate
%}
{%- endfor %}
</section>
{%- endif %}
