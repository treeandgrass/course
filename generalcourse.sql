/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : generalcourse

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-24 17:44:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `columnId` int(11) NOT NULL,
  `publishTime` datetime DEFAULT NULL,
  `deadLine` datetime DEFAULT NULL,
  `userId` bigint(11) NOT NULL,
  `status` int(11) NOT NULL,
  `scanCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '课程简介', '1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '7', '2016-06-30 09:10:12', null, '1', '1', '2');
INSERT INTO `article` VALUES ('2', '数据结构大赛', '1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '13', '2016-07-06 09:44:23', null, '1', '3', '1');
INSERT INTO `article` VALUES ('3', '数据学习', '直译过来就是跨站请求伪造的意思，也就是在用户会话下对某个CGI做一些GET/POST的事情——这些事情用户未必知道和愿意做，可以把它想做HTTP会话劫持。\r\n　　_xsrf是一种知乎的跨域验证方案，举个栗子在A.html页面中存在一个input(hidden),server给这个hideen随机赋值并储存，然后当用户post提交到B.html时验证这个xsrf是否正确。一般用于防止爬虫、恶意提交之类的。那么如何获取_xhrf呢？可以使用HttpWebRequest来模拟，获取html源代码然后找出xhrf。\r\n　　网站是通过cookie来识别用户的，当用户成功进行身份验证之后浏览器就会得到一个标识其身份的cookie，只要不关闭浏览器或者退出登录，以后访问这个网站会带上这个cookie。如果这期间浏览器被人控制着请求了这个网站的url，可能就会执行一些用户不想做的功能（比如修改个人资料）。因为这个不是用户真正想发出的请求，这就是所谓的请求伪造；因为这些请求也是可以从第三方网站提交的，所以前缀跨站二字。1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '14', '2016-07-04 10:37:20', null, '2', '3', '0');
INSERT INTO `article` VALUES ('4', '数据设计', 'Robert L.Kruse在《数据结构与程序设计》一书中，将一个数据结构的设计过程分成抽象层、数据结构层和实现层。其中，抽象层是指抽象数据类型层，它讨论数据的逻辑结构及其运算，数据结构层和实现层讨论一个数据结构的表示和在计算机内的存储细节以及运算的实现。1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '16', '2016-07-13 14:06:20', null, '2', '2', '4');
INSERT INTO `article` VALUES ('5', '数据分析', '数据元素的机内表示（映像方法）： 用二进制位（bit）的位串表示数据元素。通常称这种位串为节点（node）。当数据元素有若干个数据项组成时，位串中与个数据项对应的子位串称为数据域（data field）。因此，节点是数据元素的机内表示（或机内映像）。1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '20', '2016-07-20 14:07:33', null, '1', '2', '4');
INSERT INTO `article` VALUES ('6', '数据结构与算法', '关系的机内表示（映像方法）：数据元素之间的关系的机内表示可以分为顺序映像和非顺序映像，常用两种存储结构：顺序存储结构和链式存储结构。顺序映像借助元素在存储器中的相对位置来表示数据元素之间的逻辑关系。非顺序映像借助指示元素存储位置的指针（pointer）来表示数据元素之间的逻辑关系。1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '21', '2016-07-13 14:08:10', null, '2', '2', '4');
INSERT INTO `article` VALUES ('7', '数据解析', '一般认为，一个数据结构是由数据元素依据某种逻辑联系组织起来的。对数据元素间逻辑关系的描述称为数据的逻辑结构；数据必须在计算机内存储，数据的存储结构是数据结构的实现形式，是其在计算机内的表示；此外讨论一个数据结构必须同时讨论在该类数据上执行的运算才有意义。一个逻辑数据结构可以有多种存储结构，且各种存储结构影响数据处理的效率。1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '22', '2016-07-21 14:09:20', null, '1', '3', '2');
INSERT INTO `article` VALUES ('8', '计算机科学', '在计算机科学中，数据结构是一门研究非数值计算的程序设计问题中计算机的操作对象（数据元素）以及它们之间的关系和运算等的学科，而且确保经过这些运算后所得到的新结构仍然是原来的结构类型。1.加载Bitmap的方式\r\n\r\nBitmap在Android中指的是一张图片。通过BitmapFactory类提供的四类方法：decodeFile,decodeResource,decodeStream和decodeByteArray,分别从文件系统，资源，输入流和字节数组中加载出一个Bitmap对象，其中decodeFile,decodeResource又间接调用了decodeStream方法，这四类方法最终是在Android的底层实现的，对应着BitmapFactory类的几个native方法。\r\n\r\n2.BitmapFactory.Options的参数\r\n\r\n①inSampleSize参数\r\n\r\n上述四类方法都支持BitmapFactory.Options参数，而Bitmap的按一定采样率进行缩放就是通过BitmapFactory.Options参数实现的，主要用到了inSampleSize参数，即采样率。通过对inSampleSize的设置，对图片的像素的高和宽进行缩放。\r\n\r\n当inSampleSize=1，即采样后的图片大小为图片的原始大小。小于1，也按照1来计算。\r\n当inSampleSize>1，即采样后的图片将会缩小，缩放比例为1/(inSampleSize的二次方)。\r\n\r\n例如：一张1024 ×1024像素的图片，采用ARGB8888格式存储，那么内存大小1024×1024×4=4M。如果inSampleSize=2，那么采样后的图片内存大小：512×512×4=1M。\r\n\r\n注意：官方文档支出，inSampleSize的取值应该总是2的指数，如1，2，4，8等。如果外界传入的inSampleSize的值不为2的指数，那么系统会向下取整并选择一个最接近2的指数来代替。比如3，系统会选择2来代替。当时经验证明并非在所有Android版本上都成立。\r\n\r\n关于inSampleSize取值的注意事项：\r\n通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。\r\n\r\n例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样图片就会被拉伸而导致模糊。\r\n\r\n②inJustDecodeBounds参数\r\n\r\n我们需要获取加载的图片的宽高信息，然后交给inSampleSize参数选择缩放比缩放。那么如何能先不加载图片却能获得图片的宽高信息，通过inJustDecodeBounds=true，然后加载图片就可以实现只解析图片的宽高信息，并不会真正的加载图片，所以这个操作是轻量级的。当获取了宽高信息，计算出缩放比后，然后在将inJustDecodeBounds=false,再重新加载图片，就可以加载缩放后的图片。\r\n\r\n注意：BitmapFactory获取的图片宽高信息和图片的位置以及程序运行的设备有关，比如同一张图片放在不同的drawable目录下或者程序运行在不同屏幕密度的设备上，都可能导致BitmapFactory获取到不同的结果，和Android的资源加载机制有关。\r\n\r\n3.高效加载Bitmap的流程\r\n\r\n①将BitmapFactory.Options的inJustDecodeBounds参数设为true并加载图片。\r\n\r\n②从BitmapFactory.Options中取出图片的原始宽高信息，它们对应于outWidth和outHeight参数。', '23', '2016-07-13 14:10:34', null, '1', '2', '2');

-- ----------------------------
-- Table structure for article_picture
-- ----------------------------
DROP TABLE IF EXISTS `article_picture`;
CREATE TABLE `article_picture` (
  `APId` int(11) NOT NULL,
  `articleId` int(11) NOT NULL,
  `pictureId` int(11) NOT NULL,
  PRIMARY KEY (`APId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_picture
-- ----------------------------
INSERT INTO `article_picture` VALUES ('1', '1', '6');
INSERT INTO `article_picture` VALUES ('2', '2', '6');
INSERT INTO `article_picture` VALUES ('3', '3', '6');
INSERT INTO `article_picture` VALUES ('4', '4', '6');
INSERT INTO `article_picture` VALUES ('5', '5', '6');
INSERT INTO `article_picture` VALUES ('6', '6', '6');
INSERT INTO `article_picture` VALUES ('7', '7', '6');
INSERT INTO `article_picture` VALUES ('8', '8', '6');

-- ----------------------------
-- Table structure for columns
-- ----------------------------
DROP TABLE IF EXISTS `columns`;
CREATE TABLE `columns` (
  `columnId` bigint(11) NOT NULL AUTO_INCREMENT,
  `columnName` varchar(255) NOT NULL,
  `upId` bigint(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`columnId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of columns
-- ----------------------------
INSERT INTO `columns` VALUES ('1', '首页', null, 'index.jsp');
INSERT INTO `columns` VALUES ('2', '课程介绍', null, 'courseIntroduce.jsp');
INSERT INTO `columns` VALUES ('3', '教学团队', null, 'courseResouce.jsp');
INSERT INTO `columns` VALUES ('4', '课程建设', null, 'courseResouce.jsp');
INSERT INTO `columns` VALUES ('5', '课程资源', null, 'courseResouce.jsp');
INSERT INTO `columns` VALUES ('6', '课程研究', null, 'courseResouce.jsp');
INSERT INTO `columns` VALUES ('7', '课程简介', '2', 'content.jsp');
INSERT INTO `columns` VALUES ('9', '教学方法', '2', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('10', '课程安排', '2', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('11', '课程大纲', '2', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('12', '课程理念与目标', '2', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('13', '课程动态', '2', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('14', '优秀教师', '3', 'content.jsp');
INSERT INTO `columns` VALUES ('15', '贡献', '3', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('16', '优秀资源', '4', 'content.jsp');
INSERT INTO `columns` VALUES ('17', '基础设施', '4', 'courseDynamic.jsp');
INSERT INTO `columns` VALUES ('18', '课件', '5', 'courseware.jsp');
INSERT INTO `columns` VALUES ('19', '教学视频', '5', 'courseVideo.jsp');
INSERT INTO `columns` VALUES ('20', '提问', '6', 'content.jsp');
INSERT INTO `columns` VALUES ('21', '教师回答', '6', 'content.jsp');
INSERT INTO `columns` VALUES ('22', '课程论文', '7', 'content.jsp');
INSERT INTO `columns` VALUES ('23', '课程精解', '7', 'content.jsp');

-- ----------------------------
-- Table structure for course_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `course_dynamic`;
CREATE TABLE `course_dynamic` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `holdtime` datetime NOT NULL,
  `columnId` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_dynamic
-- ----------------------------
INSERT INTO `course_dynamic` VALUES ('1', '数据结构大赛', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('2', '程序设计大赛', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('3', '数据结构研讨大会', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('4', '数据结构课程设计', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('5', '数据结构研讨大会', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('6', '数据讲解', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('7', '数据比赛', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('8', '数据结构', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('9', '数据设计', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('10', '数据解析', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('11', '讲解', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('12', '学习交流', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('13', '动手实践', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('14', '学习研讨', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('15', '心得分享', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('16', '视频学习', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('17', '知识分享', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('18', '探究学习', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('19', '课程设计2', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('20', '比赛设计', '2016-06-30 09:12:11', '13');
INSERT INTO `course_dynamic` VALUES ('21', '认真研讨', '2016-06-30 09:12:11', '13');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `size` double(11,0) DEFAULT NULL,
  `introduce` text,
  `publishedtime` datetime DEFAULT NULL,
  `userId` varchar(11) DEFAULT NULL,
  `details` text,
  `url` varchar(255) DEFAULT NULL,
  `downurl` varchar(255) NOT NULL,
  `adressurl` varchar(255) NOT NULL,
  `pictureId` bigint(11) NOT NULL,
  `judgeId` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '数据结构', '10', '简介', '2016-06-30 00:00:00', '1', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '0');
INSERT INTO `file` VALUES ('2', 'java教学视频', '15', '简介', '2016-06-30 00:00:00', '2', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '0');
INSERT INTO `file` VALUES ('3', '算法分析', '200', '简介', '2016-06-30 00:00:00', '1', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '0');
INSERT INTO `file` VALUES ('4', '程序设计', '300', '简介', '2016-06-30 00:00:00', '2', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '0');
INSERT INTO `file` VALUES ('5', '课程精解', '500', '简介', '2016-06-30 00:00:00', '1', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '0');
INSERT INTO `file` VALUES ('6', '数据处理', '500', '简介', '2016-06-30 00:00:00', '2', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '0');
INSERT INTO `file` VALUES ('7', '计算机存储', '7676', '简介', '2016-07-14 16:47:28', '1', '数据的物理结构是数据结构在计算机中的表示（又称映像），它包括数据元素的机内表示和关系的机内表示。由于具体实现的方法有顺序、链接、索引、散列等多种，所以，一种数据结构可表示成一种或多种存储结构', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '1');
INSERT INTO `file` VALUES ('8', '元素的集合', '343434', '简介', '2016-07-14 16:51:17', '2', '关系的机内表示（映像方法）：数据元素之间的关系的机内表示可以分为顺序映像和非顺序映像，常用两种存储结构：顺序存储结构和链式存储结构。顺序映像借助元素在存储器中的相对位置来表示数据元素之间的逻辑关系。非顺序映像借助指示元素存储位置的指针（pointer）来表示数据元素之间的逻辑关系。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '1');
INSERT INTO `file` VALUES ('9', '逻辑结构', '343', '简介', '2016-07-21 16:52:56', '1', '\"数据结构\"作为一门独立的课程在国外是从1968年才开始设立的。 1968年美国唐纳德·克努特（Donald Ervin Knuth）教授开创了数据结构的最初体系，他所著的《计算机程序设计艺术》第一卷《基本算法》是第一本较系统地阐述数据的逻辑结构和存储结构及其操作的著作。\"数据结构\"在计算机科学中是一门综合性的专业基础课，数据结构是介于数学、计算机硬件和计算机软件三者之间的一门核心课程。数据结构这一门课的内容不仅是一般程序设计（特别是非数值性程序设计）的基础，而且是设计和实现编译程序、操作系统、数据库系统及其他系统程序的重要基础。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '1');
INSERT INTO `file` VALUES ('10', '线性结构', '454', '简介', '2016-07-14 16:54:40', '2', '而信息的表示和组织又直接关系到处理信息的程序的效率。随着计算机的普及，信息量的增加，信息范围的拓宽，使许多系统程序和应用程序的规模很大，结构又相当复杂。因此，为了编写出一个\"好\"的程序，必须分析待处理的对象的特征及各对象之间存在的关系，这就是数据结构这门课所要研究的问题。众所周知，计算机的程序是对信息进行加工处理。在大多数情况下，这些信息并不是没有组织，信息（数据）之间往往具有重要的结构关系，这就是数据结构的内容。数据的结构，直接影响算法的选择和效率。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '1');
INSERT INTO `file` VALUES ('11', '树形结构', '434', '简介', '2016-07-07 16:56:32', '1', '寻求数学模型的实质是分析问题，从中提取操作的对象，并找出这些操作对象之间含有的关系，然后用数学的语言加以描述。当人们用计算机处理数值计算问题是，所用的数学模型是用数学方程描述。所涉及的运算对象一般是简单的整形、实型和逻辑型数据，因此程序设计者的主要精力集中于程序设计技巧上，而不是数据的存储和组织上。然而，计算机应用的更多领域是\"非数值型计算问题\"，它们的数学模型无法用数学方程描述，而是用数据结构描述，解决此类问题的关键是设计出合适的数据结构，描述非数值型问题的数学模型是用线性表、树、图等结构来描述的。', 'reception/local/detailPage.jsp', 'filedownload', 'G://file/0001.mp3', '1', '1');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `moduleId` bigint(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `upid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '模块管理', 'admin/ModuleList', '3');
INSERT INTO `module` VALUES ('2', '网站内容管理', '#', null);
INSERT INTO `module` VALUES ('3', '系统管理', '#', null);
INSERT INTO `module` VALUES ('5', '审核文章', 'admin/ArticleReviewList', '2');
INSERT INTO `module` VALUES ('6', '栏目管理', 'admin/ColumnList', '2');
INSERT INTO `module` VALUES ('7', '人员管理', 'admin/UserList', '3');
INSERT INTO `module` VALUES ('8', '角色管理', 'admin/RoleList', '3');
INSERT INTO `module` VALUES ('9', '权限管理', 'admin/Permission', '3');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permissionId` bigint(11) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(11) DEFAULT NULL,
  `moduleId` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '1', '2');
INSERT INTO `permission` VALUES ('2', '1', '1');
INSERT INTO `permission` VALUES ('3', '1', '3');
INSERT INTO `permission` VALUES ('4', '1', '4');
INSERT INTO `permission` VALUES ('5', '1', '5');
INSERT INTO `permission` VALUES ('6', '1', '6');
INSERT INTO `permission` VALUES ('7', '1', '7');
INSERT INTO `permission` VALUES ('8', '1', '8');
INSERT INTO `permission` VALUES ('9', '1', '9');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pictureId` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', 'person.jpg');
INSERT INTO `picture` VALUES ('6', 'person.jpg');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` bigint(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');
INSERT INTO `role` VALUES ('3', '游客');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registerTime` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` smallint(6) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '小明', '321', '2016-07-01 09:32:45', '1', null, null, '1', null);
INSERT INTO `users` VALUES ('2', '小华', '434', '2016-07-13 14:22:47', '1', null, null, '1', null);
INSERT INTO `users` VALUES ('3', '李华', '123', '2016-07-06 09:47:33', '3', '', '', '1', null);
INSERT INTO `users` VALUES ('4', '小花', '123', '2016-07-06 09:49:18', '3', '', '', '2', null);
