---
layout: post
title: herding frosh 算法
date: 2010-01-19 07:33:59.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  aktt_notify_twitter: 'no'
  dsq_thread_id: '4543641094'
author: 
permalink: "/2010/01/herding-frosh-%e7%ae%97%e6%b3%95.html"
---
```
package programming.challenges;
import java.util.Arrays;
/**
* Created by IntelliJ IDEA.
* User: zhangjiayin
* Date: Jan 13, 2010
* Time: 7:15:50 PM
* To change this template use File | Settings | File Templates.
*/
public class HerdingTrees {
private Tree origin = new Tree(0, 0);
/**
* get min value of a and b
* @param a
* @param b
* @return
*/
private static double min(double a, double b) {
return a > b ? b : a;
}
/**
* “vector o p1″ cross “vector o p2″
* @param o
* @param p1
* @param p2
* @return
*/
private static double cross(Tree o , Tree p1, Tree p2) {
return (p1.x – o.x) * (p2.y – o.y) – (p1.y – o.y) * (p2.x – o.x);
}
/**
* ”vector p1″ cross “vector p2″
* @param p1
* @param p2
* @return
*/
private static double cross(Tree p1, Tree p2) {
return p1.x * p2.y – p1.y * p2.x;
}
/**
* distance of two tree p2 and p1
* @param p1
* @param p2
* @return
*/
private static double getDistance(Tree p1, Tree p2) {
return Math.sqrt(Math.pow(p1.x – p2.x, 2) + Math.pow(p1.y – p2.y, 2));
}
/**
* sort by angle in polar coordinate system
* if the angle is the same, then sort by their length
* @param p1
* @param p2
* @return
*/
public static boolean sortByAngle(Tree p1, Tree p2) {
if (p1.y == 0 && p2.y == 0 && p1.x * p2.x <= 0) return p1.x > p2.x;
if (p1.y == 0 && p1.x >= 0 && p2.y != 0) return true;
if (p2.y == 0 && p2.x >= 0 && p1.y != 0) return false;
if (p1.y * p2.y < 0) return p1.y > p2.y;
double c = cross(p1, p2);
return c > 0 || c == 0 && Math.abs(p1.x) < Math.abs(p2.x);
}
/**
* determine if o -> p1 -> p2 are convex (refer to the origin)
* @param o
* @param p1
* @param p2
* @return
*/
private boolean convex(Tree o, Tree p1,Tree p2) {
double c = cross(o, p1, p2);
return c > 0 || c == 0 && ((p1.x – o.x) * (p2.x – p1.x) + (p1.y – o.y) * (p2.y – p1.y)) < 0;
}
/**
* instance of this algorithm
* @param trees
* @return
*/
public double goaround(Tree[] trees) {
int[] hulls = new int[1000];
int i, j, k;
int treesCount = trees.length;
// the special case
if (treesCount == 0) {
return 2.0;
}
// sort all trees by their angle in polar coordinate system
Arrays.sort(trees);
double ans = 1e9;
// start from each possible tree
for (i=0; i<treescount get a proper hull by the graham scan k="0;" for j treescount int p="(i+j)" while>= 2 &amp;&amp; !convex(trees[hulls[k-2]], trees[hulls[k-1]], trees[p])) k–;
hulls[k++] = p;
}
// calculate the distance of the hull
double length = getDistance(trees[i], origin) + getDistance(trees[(i-1+treesCount)%treesCount], origin);
for (j=0; j<k-1 length getdistance trees record the minimal distance ans="min(ans," print solution don forget to plus return public static void main argv tree new double a="new" herdingtrees system.out.println trees2="{new" b="new" class implements comparable> {
public double x = 0;
public double y = 0;
public Tree(int x, int y) {
this.x = x;
this.y = y;
}
public int compareTo(Tree p) {
return HerdingTrees.sortByAngle(this, p) ? 0 : 1;
}
}
package programming.challenges;
import java.util.Arrays;
/** * Created by IntelliJ IDEA. * User: zhangjiayin * Date: Jan 13, 2010 * Time: 7:15:50 PM * To change this template use File | Settings | File Templates. */public class HerdingTrees {
private Tree origin = new Tree(0, 0); /** * get min value of a and b * @param a * @param b * @return */ private static double min(double a, double b) { return a &gt; b ? b : a; }
/** * “vector o p1″ cross “vector o p2″ * @param o * @param p1 * @param p2 * @return */ private static double cross(Tree o , Tree p1, Tree p2) { return (p1.x – o.x) * (p2.y – o.y) – (p1.y – o.y) * (p2.x – o.x); }
/** * ”vector p1″ cross “vector p2″ * @param p1 * @param p2 * @return */ private static double cross(Tree p1, Tree p2) { return p1.x * p2.y – p1.y * p2.x; }
/** * distance of two tree p2 and p1 * @param p1 * @param p2 * @return */ private static double getDistance(Tree p1, Tree p2) { return Math.sqrt(Math.pow(p1.x – p2.x, 2) + Math.pow(p1.y – p2.y, 2)); }

/** * sort by angle in polar coordinate system * if the angle is the same, then sort by their length * @param p1 * @param p2 * @return */ public static boolean sortByAngle(Tree p1, Tree p2) {
if (p1.y == 0 &amp;&amp; p2.y == 0 &amp;&amp; p1.x * p2.x &lt;= 0) return p1.x &gt; p2.x;
if (p1.y == 0 &amp;&amp; p1.x &gt;= 0 &amp;&amp; p2.y != 0) return true;
if (p2.y == 0 &amp;&amp; p2.x &gt;= 0 &amp;&amp; p1.y != 0) return false;
if (p1.y * p2.y &lt; 0) return p1.y &gt; p2.y;
double c = cross(p1, p2);
return c &gt; 0 || c == 0 &amp;&amp; Math.abs(p1.x) &lt; Math.abs(p2.x); }
/** * determine if o -&gt; p1 -&gt; p2 are convex (refer to the origin) * @param o * @param p1 * @param p2 * @return */ private boolean convex(Tree o, Tree p1,Tree p2) { double c = cross(o, p1, p2); return c &gt; 0 || c == 0 &amp;&amp; ((p1.x – o.x) * (p2.x – p1.x) + (p1.y – o.y) * (p2.y – p1.y)) &lt; 0; }
/** * instance of this algorithm * @param trees * @return */ public double goaround(Tree[] trees) {
int[] hulls = new int[1000];
int i, j, k;
int treesCount = trees.length;

// the special case if (treesCount == 0) { return 2.0; }

// sort all trees by their angle in polar coordinate system Arrays.sort(trees);
double ans = 1e9;
// start from each possible tree for (i=0; i<treescount get a proper hull by the graham scan k="0;" for j treescount int p="(i+j)" while>= 2 &amp;&amp; !convex(trees[hulls[k-2]], trees[hulls[k-1]], trees[p])) k–; hulls[k++] = p; }
// calculate the distance of the hull double length = getDistance(trees[i], origin) + getDistance(trees[(i-1+treesCount)%treesCount], origin); for (j=0; j<k-1 length getdistance trees record the minimal distance ans="min(ans," print solution don forget to plus return public static void main argv tree new double a="new" herdingtrees system.out.println trees2="{new" b="new" class implements comparable> { public double x = 0;
public double y = 0;
public Tree(int x, int y) { this.x = x; this.y = y; }
public int compareTo(Tree p) { return HerdingTrees.sortByAngle(this, p) ? 0 : 1;

}

}
</k-1></treescount></k-1></treescount>
```
