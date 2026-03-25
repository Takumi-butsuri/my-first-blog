[33mcommit d6e27f8569e0c5947cb0e5579db3fa1e2a793a4e[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m)[m
Author: Takumi <udkt.udkt@gmail.com>
Date:   Wed Mar 25 14:32:38 2026 +0900

    Modified templates to display posts from database

[1mdiff --git a/blog/templates/blog/post_list.html b/blog/templates/blog/post_list.html[m
[1mindex 9adc192..7db871b 100644[m
[1m--- a/blog/templates/blog/post_list.html[m
[1m+++ b/blog/templates/blog/post_list.html[m
[36m@@ -7,16 +7,12 @@[m
             <h1><a href="/">Django Girls Blog</a></h1>[m
         </div>[m
 [m
[31m-        <div>[m
[31m-            <p>published: 2026/03/24, 15:12</p>[m
[31m-            <h2><a href="">My first post</a></h2>[m
[31m-            <p>Aenean eu leo quam. こんにちは！　よろしくお願いします！ </p>[m
[31m-        </div>[m
[31m-[m
[31m-        <div>[m
[31m-            <p>公開日: 2026/03/24, 15:12</p>[m
[31m-            <h2><a href="">2番目の投稿</a></h2>[m
[31m-            <p>こんにちは！　よろしくお願いします！ </p>[m
[31m-        </div>[m
[32m+[m[32m        {% for post in posts %}[m
[32m+[m[32m            <div>[m
[32m+[m[32m                <p>published: {{ post.published_date }}</p>[m
[32m+[m[32m                <h2><a href="">{{ posts.title }}</a></h2>[m
[32m+[m[32m                <p>{{ posts.text|linebreaksbr}}</p>[m
[32m+[m[32m            </div>[m
[32m+[m[32m        {% endfor %}[m
     </body>[m
 </html>[m
\ No newline at end of file[m
[1mdiff --git a/blog/views.py b/blog/views.py[m
[1mindex ba1e357..d4116e8 100644[m
[1m--- a/blog/views.py[m
[1m+++ b/blog/views.py[m
[36m@@ -1,5 +1,8 @@[m
 from django.shortcuts import render[m
[32m+[m[32mfrom django.utils import timezone[m
[32m+[m[32mfrom .models import Post[m
 [m
 # Create your views here.[m
 def post_list(request):[m
[31m-    return render(request, 'blog/post_list.html', {})[m
\ No newline at end of file[m
[32m+[m[32m    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')[m
[32m+[m[32m    return render(request, 'blog/post_list.html', {'posts': posts})[m
\ No newline at end of file[m
