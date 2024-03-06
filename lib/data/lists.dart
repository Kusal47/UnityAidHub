import 'package:flutter/material.dart';

// List<dynamic> data = [
//   {'title': "Users", 'count': 12, 'icon': Icons.person, 'onClick': () {}},
//   {'title': "Categories", 'count': 12, 'icon': Icons.person, 'onClick': () {}},
//   {'title': "Unverified Posts", 'count': 12, 'icon': Icons.person, 'onClick': () {}},
//   {'title': "Verified Posts", 'count': 12, 'icon': Icons.person, 'onClick': () {}},
// ];



// List<dynamic> data = [
//       {
//         'title': "Users",
//         'count': Provider.of<UserViewModel>(context).details.length,
//         'icon': Icons.person,
//         'onClick': () { }
//       },
//       {
//         'title': "Categories",
//         'count':
//             Provider.of<DashboardViewModel>(context, listen: false).categoryDetails,
//         'icon': Icons.category,
//         'onClick': () {
         
//         }
//       },
//       {
//         'title': "Verified Posts",
//         'count': Provider.of<DashboardViewModel>(context).verifiedPostDetails,
//         'icon': Icons.verified_outlined,
//         'onClick': () {
//         }
//       },
//       {
//         'title': "Unverified Posts",
//         'count': Provider.of<PostVerificationViewModel>(context).details,
//         'icon': Icons.warning_amber_rounded,
//         'onClick': () {
         
//         }
//       },
     
//     ];
   
List<String> items = [
  '10',
  '50',
  '100',
  '200',
];
List<String> categoryList = [
  'Health',
  'StartUps',
  'Animal',
  'Environment',
  'Non-Profits',
  'Childrens',
  'Memorial',
  'Education',
  'Others'
];
List<String> currency = [
  'NPR',
  'INR',
  'USD',
  'EUR',
  'GBP',
];
List<String> postType = [
  'BASIC',
  'URGENT',
];
List<String> adsStyle = [
  'BANNER',
  'CARD',
  'HALFBANNER',
];

final List list = [
  'New user was added.',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
  'Rs.1000 donation was done through fonepay for health category',
];

// List<Post> posts = [
//   Post(
//     postId: 0,
//     image: [AssetsPath.portraitdarklogo],
//     title: 'My Little Boy Can’t Breathe, And I’m Helpless.',
//     date: '2024-10-11' ,
//     desc:
//         'Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vid is a gesture of hope, helping to ensure Vidhi\'s second chance at life. To contribute and be a part of this life-changing journey, Together, we can make a difference and show the world the strength of community and the power of familial love. Thank you for being a source of light in the Mehrotra family\'s darkest hour.',
//   ),
//   Post(
//     postId: 1,
//     image: [AssetsPath.portraitdarklogo],
//     title: 'My Little Boy ',
//     date: '2024-10-10',
//     desc:
//         'Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved with Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved withAnjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved withAnjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved withAnjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved withAnjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved withAnjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved withAnjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved with',
//   ),
//   Post(
//     postId: 2,
//     image: [AssetsPath.portraitdarklogo],
//     title: 'My Little Boy Can’t Breathe, And I’m Helpless. Please Save Him For Me.',
//     date: '2024-10-10',
//     desc:
//         'Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life.sture of hope, helping to ensure Vidhi\'s second chance at life. To contribute and be a part of this life-changing journey, Together, we can make a difference and show the world the strength of community and the power of familial love. Thank you for being a source of light in the Mehrotra family\'s darkest hour.',
//   ),
//   Post(
//     postId: 3,
//     image: [AssetsPath.portraitdarklogo],
//     title: ' Please Save Him For Me.',
//     date: '2024-10-10',
//     desc:
//         'Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver conde of hope, helping to ensure Vidhi\'s second chance at life. To contribute and be a part of this life-changing journey, Together, we can make a difference and show the world the strength of community and the power of familial love. Thank you for being a source of light in the Mehrotra family\'s darkest hour.',
//   ),
//   Post(
//     postId: 4,
//     image: [AssetsPath.portraitdarklogo],
//     title: 'My Little Boy Can’t Breathe,Please Save Him For Me.',
//     date: '2024-10-10',
//     desc:
//         'Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. To contribute and be a part of this life-changing journey, Together, we can make a difference and show the world the strength of community and the power of familial love. Thank you for being a source of light in the Mehrotra family\'s darkest hour.',
//   ),
//   Post(
//     postId: 5,
//     image: [AssetsPath.portraitdarklogo],
//     title: ' I’m Helpless. Please Save Him For Me.',
//     date: '2024-10-14',
//     desc:
//         'Together, we can make a difference and show the world the strength of community and the power of familial love. Thank you for being a source of light in the Mehrotra family\'s darkest hour.',
//   ),
// ];

// List<User> userLists = [
//   User(
//       userId: 0,
//       category: 'Health',
//       date: '2024-01-01',
//       username: 'Nilnitin Mukesh',
//       paymentMethod: 'Khalti',
//       status: 'processing',
//       amount: '\$ 100.0'),
//   User(
//       userId: 1,
//       category: 'Animal',
//       date: '2024-01-02',
//       username: 'Ram Bahadur magar chhetri',
//       paymentMethod: 'FonePay',
//       status: 'success',
//       amount: '\$ 1000.0'),
//   User(
//       userId: 2,
//       category: 'StartUps',
//       date: '2024-01-02',
//       username: 'Kushal Aryal',
//       paymentMethod: 'Esewa',
//       status: 'unverified',
//       amount: '\$ 1100.0'),
//   User(
//       userId: 3,
//       category: 'Environment',
//       date: '2024-01-03',
//       username: 'Jonny Deep',
//       paymentMethod: 'Bank',
//       status: 'processing',
//       amount: '\$ 1200.0'),
//   User(
//       userId: 4,
//       category: 'Children',
//       date: '2024-01-04',
//       username: 'Jack Sparrow',
//       paymentMethod: 'PayPal',
//       status: 'processing',
//       amount: '\$ 199.0'),
//   User(
//       userId: 5,
//       category: 'Health',
//       date: '2024-01-04',
//       username: 'qwertyuiop asdfghjkl zxcvbnm',
//       paymentMethod: 'Khalti',
//       status: 'failed',
//       amount: '\$ 99.0'),
// ];
