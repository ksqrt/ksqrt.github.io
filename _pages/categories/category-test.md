---
title: "Test"
layout: archive
permalink: categories/Test
author_profile: true
sidebar_main: true
---



{% assign posts = site.categories.Test %}
{% for post in posts %} {% include archive-single2.html type=page.entries_layout %} {% endfor %}
