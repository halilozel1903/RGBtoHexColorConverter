# RGB to Hex & Hex to RGB Converter App

RGB to Hex ve Hex to RGB dönüşümleri ile ilgili bir iOS uygulamasıdır. <br>
Uygulama Swift-4 ile geliştirilmektedir. <br>
Kullanıcıdan alınan değerlere göre dönüşümler yapılmaktadır. <br>
Dönüşümlerde elde edilen değerlere göre uygulamanın arka plan rengi değişmektedir. <br>

<br>

## RGB Nedir ?

![Rgb](rgb.png)

Red (kırmızı) , Green (yeşil), Blue (mavi) renklerinden oluşmuş, bir renk sistemidir.<br>
RGB renk sistemi, insan gözünü taklit eden dijital sistemlerde (tarayıcılar, dijital kameralar vb.) ve monitörlerde kullanılır.

<br>

## Hex(Hexadecimal) Nedir ?

![Heksadesimal](Heksadesimal.png)

Hexadecimal “On altılık” düzenin alabileceği değerler; 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F’dir, <br>
0’dan F’ye kadar olan karakterlerin toplam adedi 16 olduğu için on altılık düzen denilmektedir. 

<br>

## RGB to hex conversion

Kırmızı, yeşil ve mavi renk değerlerini onluktan onaltıya dönüştürün. <br>
Kırmızı, yeşil ve mavi togather: RRGGBB'nin 3 hex değerini birleştirin. <br>


### Examples

__Example #1__

Convert red color (255,0,0) to hex color code:

R = (255)10 = (FF)16

G = (0)10 = (00)16

B = (0)10 = (00)16

So the hex color code is:

Hex = FF0000

<br> <br>

__Example #2__
Convert gold color (255,215,0) to hex color code:

R = (255)10 = (FF)16

G = (215)10 = (D7)16

B = (0)10 = (00)16

So the hex color code is:

Hex = FFD700

<br> <br>

### Hex to RGB conversion

Altı renk kodunun 2 sol hanesini alın ve kırmızı renk seviyesini elde etmek için ondalık değere dönüştürün. <br>
Altı renk kodunun 2 orta basamağını alın ve yeşil renk seviyesini elde etmek için ondalık değere dönüştürün. <br>
Altıgen renk kodunun 2 hanesini alın ve mavi renk seviyesini elde etmek için ondalık değere dönüştürün. <br>
