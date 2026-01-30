import 'package:safar_store/features/shop/models/banners_model.dart';
import 'package:safar_store/features/shop/models/brand_category_model.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/features/shop/models/product_attribute_model.dart';
import 'package:safar_store/features/shop/models/product_category_model.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/features/shop/models/product_variation_model.dart';
import 'package:safar_store/routes/routes.dart';

import 'features/shop/models/category_model.dart';
import 'utils/constants/images.dart';

class UDummyData {
  /// List of all Banners

  static final List<BannerModel> banner = [
    BannerModel(
      imageUrl: UImages.homeBanner1,
      targetScreen: URoutes.store,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner2,
      targetScreen: URoutes.allProducts,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner3,
      targetScreen: URoutes.wishlist,
      active: true,
    ),
    BannerModel(
      imageUrl: UImages.homeBanner4,
      targetScreen: URoutes.profile,
      active: true,
    ),
  ];

  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(
      id: '1',
      name: 'Travel',
      image: UImages.traveliconImage,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Clothing',
      image: UImages.clothingiconImage,
      isFeatured: true,
    ),
    CategoryModel(
      id: '9',
      name: 'Beauty',
      image: UImages.beautyiconImage,
      isFeatured: true,
    ),

    ///---------[Sub Categories]-----------
    /// Travel
    CategoryModel(
      id: '2',
      name: 'Luggage & Bags',
      image: UImages.travelLuggageImage,
      parentId: '1',
    ),
    CategoryModel(
      id: '3',
      name: 'Travel Clothing',
      image: UImages.travelclothesImage,
      parentId: '1',
    ),
    CategoryModel(
      id: '4',
      name: 'Travel Electronics',
      image: UImages.travelelectronicImage,
      parentId: '1',
    ),

    /// Clothing
    CategoryModel(
      id: '6',
      name: 'Mens Fashion',
      image: UImages.mensiconImage,
      parentId: '5',
    ),
    CategoryModel(
      id: '7',
      name: 'Womens Fashion',
      image: UImages.womeniconImage,
      parentId: '5',
    ),
    CategoryModel(
      id: '8',
      name: 'Kids Fashion',
      image: UImages.kidsiconImage,
      parentId: '5',
    ),

    /// Beauty
    CategoryModel(
      id: '10',
      name: 'Skin Care',
      image: UImages.skincareiconImage,
      parentId: '9',
    ),
    CategoryModel(
      id: '11',
      name: 'Makeup',
      image: UImages.makeupiconImage,
      parentId: '9',
    ),
    CategoryModel(
      id: '12',
      name: 'Hair Care',
      image: UImages.haircareiconImage,
      parentId: '9',
    ),
    CategoryModel(
      id: '13',
      name: 'Fragrance',
      image: UImages.fragranceiconImage,
      parentId: '9',
    ),
    CategoryModel(
      id: '14',
      name: 'Nail Care',
      image: UImages.nailcareiconImage,
      parentId: '9',
    ),
    CategoryModel(
      id: '15',
      name: 'Mens Grooming',
      image: UImages.mensgroomingiconImage,
      parentId: '9',
    ),
    CategoryModel(
      id: '16',
      name: 'Bath & Body',
      image: UImages.bathandbodyiconImage,
      parentId: '9',
    ),

    ///-----------sub[[Sub Categories]]-----------
    ///Mens Fashion
    CategoryModel(
      id: '17',
      name: 'Shirts',
      image: UImages.shirticonImage,
      parentId: '6',
    ),
    CategoryModel(
      id: '18',
      name: 'T-Shirts',
      image: UImages.tshirticonImage,
      parentId: '6',
    ),
    CategoryModel(
      id: '19',
      name: 'Pants',
      image: UImages.panticonImage,
      parentId: '6',
    ),
    CategoryModel(
      id: '20',
      name: 'Jeans',
      image: UImages.jeansiconImage,
      parentId: '6',
    ),
    CategoryModel(
      id: '21',
      name: 'Jackets',
      image: UImages.jacketiconImage,
      parentId: '6',
    ),
    CategoryModel(
      id: '22',
      name: 'Shoes',
      image: UImages.shoesiconImage,
      parentId: '6',
    ),

    CategoryModel(
      id: '23',
      name: 'Dresses',
      image: UImages.dressiconImage,
      parentId: '7',
    ),
    CategoryModel(
      id: '24',
      name: 'Tops',
      image: UImages.topsiconImage,
      parentId: '7',
    ),
    CategoryModel(
      id: '25',
      name: 'Bottoms',
      image: UImages.bottomsiconImage,
      parentId: '7',
    ),
    CategoryModel(
      id: '26',
      name: 'Sarees',
      image: UImages.sareesiconImage,
      parentId: '7',
    ),
    CategoryModel(
      id: '27',
      name: 'Kurtis',
      image: UImages.kurtisiconImage,
      parentId: '7',
    ),
    CategoryModel(
      id: '28',
      name: 'FootWear',
      image: UImages.footweariconImage,
      parentId: '7',
    ),

    ///womens Fashion
    CategoryModel(
      id: '29',
      name: 'Boys Clothing',
      image: UImages.boysclothingiconImage,
      parentId: '8',
    ),
    CategoryModel(
      id: '30',
      name: 'Girls Clothing',
      image: UImages.girlsclothingiconImage,
      parentId: '8',
    ),
    CategoryModel(
      id: '31',
      name: 'Baby Wear',
      image: UImages.babyweariconImage,
      parentId: '8',
    ),
    CategoryModel(
      id: '32',
      name: 'Kids Shoes',
      image: UImages.kidsiconImage,
      parentId: '8',
    ),
  ];

  /// List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      name: 'Adidas',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090499/brand_images/dni0ntnyinpllxwxebsr.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '2',
      name: 'Ajmal',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090501/brand_images/bwuavwexebjqacfoc0j5.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '3',
      name: 'Allen Solly',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090503/brand_images/raanlvak5g9xnnouauo2.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '4',
      name: 'Ambrane',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090505/brand_images/mznvi7yckr2hxkmse40g.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '5',
      name: 'American Tourister',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090506/brand_images/deunwgjm2v3uttcgrnvr.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '6',
      name: 'Aristocart',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090508/brand_images/tkswnmuzldeeprs1edgl.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '7',
      name: 'Aurelia',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090509/brand_images/bgbvqhyit1dsjbxwfmte.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '8',
      name: 'Babyhug',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090510/brand_images/sdebiofatctzz5aoox4w.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '9',
      name: 'Beardo',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090512/brand_images/nzbkcr4uqxvffwp6u4kg.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '10',
      name: 'Bella Vita',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090519/brand_images/nn6gzctnnbigs0g23qcx.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '11',
      name: 'Biba',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090539/brand_images/obdm69hi9zfwvdmhbvtu.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '12',
      name: 'Biotique',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090541/brand_images/x6tod6w0a0y6e6wyr0te.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '13',
      name: 'Blue Heaven',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090542/brand_images/rhlodinomuxdcd6nyutz.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '14',
      name: 'Boat',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090544/brand_images/l2jn7vyhi6kxarbfcesd.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '15',
      name: 'Bombay Shaving Company',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090547/brand_images/ha1dhh73lqs0wdeee7p7.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '16',
      name: 'Campus Sutra',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090548/brand_images/uqupcbfltsr1lachrfvm.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '17',
      name: 'Colorbar',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090550/brand_images/zkxvtzyplivsqmv9zmxs.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '18',
      name: 'Decathlon',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090551/brand_images/djgwjcpexuq62k1uglkv.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '19',
      name: 'Denver',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090552/brand_images/kwkbb0fthiuttbtcpaxb.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '20',
      name: 'Elle 18',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090554/brand_images/hr2pfpkuefjsgg7wwezz.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '21',
      name: 'Engage',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090556/brand_images/z0hhksw9v86fc7wo54on.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '22',
      name: 'Faces Canada',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090559/brand_images/yprctfymalul4jimdyvg.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '23',
      name: 'F Gear',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090561/brand_images/wngbf5crrzux2j0e20ku.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '24',
      name: 'Fiama',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090562/brand_images/lbp1vvrh23zjbd4aopxk.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '25',
      name: 'Firstcry',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090564/brand_images/wbgnhmrzalxtjpuh5twc.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '26',
      name: 'Fogg',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090565/brand_images/thnroria1pcrc5ncoegm.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '27',
      name: 'Forest Essentials',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090566/brand_images/qtspjfiwetwrbkjuxn2p.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '28',
      name: 'Gillette',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090568/brand_images/l4hrk90nfa3pe3bfw8do.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '29',
      name: 'Gini & Jony',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090569/brand_images/llighvnkw7uikltyujyz.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '30',
      name: 'Good Vibes',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090570/brand_images/uded4er9lpdiykkfgtgx.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '31',
      name: 'Himalaya',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090572/brand_images/hhvszvkzgfh3gco3yapc.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '32',
      name: 'Hopkids',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090574/brand_images/ciaoqbmomqwcotrbsenp.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '33',
      name: 'Hopscotch',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090575/brand_images/pf45r4ge2htwhjjppvtz.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '34',
      name: 'HRX',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090577/brand_images/cnxr66utj95x8ucpwpyb.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '35',
      name: 'Indulekha',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090579/brand_images/ijfvdwdgtiazjipewqer.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '36',
      name: 'Insight',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090580/brand_images/hvtswnuh6h9bczvkegym.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '37',
      name: 'Just Herbs',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090581/brand_images/xukxhgigiohsqbkrvef2.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '38',
      name: 'Khadi Natural',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090587/brand_images/xtblroo7exsgowg1eixk.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '39',
      name: 'Killer',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090601/brand_images/rthyznw9rts0driscouq.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '40',
      name: 'Lakme',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090602/brand_images/cuntm7vtktt1tgpcfukk.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '41',
      name: 'Lava',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090604/brand_images/ubjyyc0waucxukqjqryn.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '42',
      name: 'Lavie Sport',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090606/brand_images/uab24tnicabtdlobhllw.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '43',
      name: 'Libas',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090607/brand_images/wz9rje5z1f9bhhojvk6n.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '44',
      name: 'Lifebuoy',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090609/brand_images/zumey3dwsgbtoxypw0jt.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '45',
      name: 'Lilliput',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090610/brand_images/p9l5puzt4i5rb16p48sk.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '46',
      name: 'Little Kangaroos',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090612/brand_images/tfxmj1xsncsaeyuwvsfb.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '47',
      name: 'Lotus Herbals',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090614/brand_images/ftlkkp31d0hxjd4qdhnv.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '48',
      name: 'Louis Philippe',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090615/brand_images/fqv1znc9o9nngavgoqs4.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '49',
      name: 'Lux',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090617/brand_images/k9ydhmpwqr2ye0nc9cdo.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '50',
      name: 'Mamaearth',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090618/brand_images/lkart9v1alx1fjxrhtb0.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '51',
      name: 'Man Arden',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090619/brand_images/plxcwcdasftnkag8i0ft.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '52',
      name: 'Mars',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090621/brand_images/pnqu6qmhsu0ngyrsx6in.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '53',
      name: 'Maxx',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090622/brand_images/mhm9klex8vpajqqveeme.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '54',
      name: 'Melange',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090623/brand_images/cmfsztfy5pupoqqytzck.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '55',
      name: 'Mi',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090624/brand_images/umyjc6xcapqlkf60xixi.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '56',
      name: 'Micromax',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090626/brand_images/th0eek9zv4kgzpvjtojc.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '57',
      name: 'Minimalist',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090627/brand_images/a86orjsrdid6kpvjsqzv.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '58',
      name: 'Monte Carlo',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090628/brand_images/witwd81qahv0xnsf7eic.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '59',
      name: 'Mothercare',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090630/brand_images/u6r6hnvk4agykmqn8woq.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '60',
      name: 'Mufti',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090631/brand_images/rrkoum85bgphoned4mbe.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '61',
      name: 'MyGlamm',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090633/brand_images/snd8y0qglthuycncsjnm.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '62',
      name: 'Noise',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090635/brand_images/pakrqs405e5gll0g06bn.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '63',
      name: 'Nykaa',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090637/brand_images/hufwfcspkhjrn5gz2kgd.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '64',
      name: 'Pantaloons Junior',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090639/brand_images/x3axiux53wc1rvbocsuq.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '65',
      name: 'Park Avenue',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090640/brand_images/lijy0q9uasiqc0dqd7gi.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '66',
      name: 'Pears',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090642/brand_images/vsqeepcomdktqcugtld3.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '67',
      name: 'Peter England',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090643/brand_images/zdd7dl45gqq9xd6d4aw4.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '68',
      name: 'Plum',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090645/brand_images/jygtzgmgb68zzhwrc7jq.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '69',
      name: 'Portronics',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090647/brand_images/yufcykvvshavfkah3qak.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '70',
      name: 'pTron',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090648/brand_images/jvpuq1fxyk4h79zzjaor.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '71',
      name: 'Puma',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090649/brand_images/xrl89oewp7vzx9jm7ayg.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '72',
      name: 'Rangriti',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090651/brand_images/novo6r5y3ictsldh9rww.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '73',
      name: 'Raymond',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090653/brand_images/fvlsdhjzrymnidkxrqj2.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '74',
      name: 'Red Tape',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090654/brand_images/whvlp1ykcjzrhmdsu4di.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '75',
      name: 'Roadster',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090656/brand_images/br28rt41x4hi3het0vpx.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '76',
      name: 'Safari',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090661/brand_images/obthgg5ljz1urjwnbohe.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '77',
      name: 'Santoor',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090679/brand_images/m5gzo2movplotb2cszzt.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '78',
      name: 'Skinn',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090681/brand_images/va7eogujifu39vlolfqr.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '79',
      name: 'Skybags',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090684/brand_images/rxo7corn7fwu2i7u2fqn.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '80',
      name: 'Soch',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090686/brand_images/wuj54lqom1mvvs2nqzkw.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '81',
      name: 'Streax',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090690/brand_images/p3vfrl6vy3bq2emgacdj.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '82',
      name: 'Sugar Cosmetics',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090692/brand_images/e43ojvrjwjfsuh6mkl0y.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '83',
      name: 'Swiss Beauty',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090693/brand_images/mwfw7mjztttiebylki2a.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '84',
      name: 'Syska',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090695/brand_images/kkdc9kthfnfdl20a4bcq.png',
      isFeatured: true,
    ),
    BrandModel(
      id: '85',
      name: 'The Man Company',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090696/brand_images/enazn1lpramzizaneqnh.png',
      isFeatured: true,
    ),
    BrandModel(
      id: '86',
      name: 'TRESemmé',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090698/brand_images/zlazzwxti2guhpwrfwee.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '87',
      name: 'UrbanGabru',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090699/brand_images/ojwbgy9x3nk9i0rfh0co.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '88',
      name: 'U.S. Polo Assn.',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090700/brand_images/l0votfftgusjiqu7ch3q.jpg',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '89',
      name: 'Ustraa',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090702/brand_images/wfgsrro8naayegpi3hku.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '90',
      name: 'Van Heusen',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090703/brand_images/xadctw6zh2jpamkbshwb.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '91',
      name: 'VIP',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090705/brand_images/l49p9fturnrnxoyulwmc.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '92',
      name: 'Wildcraft',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090707/brand_images/rg9gw0tbrptitzu1623z.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '93',
      name: 'Wild Stone',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090711/brand_images/c0eeeiwuycm6dqz1nyyi.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '94',
      name: 'Woodland',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090715/brand_images/kwtj6ikjqjsqhbnsfmos.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '95',
      name: 'WOW Skin Science',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090720/brand_images/ghbqnb9fdvins3d3jztv.png',
      isFeatured: true,
    ),
    BrandModel(
      id: '96',
      name: 'Zebronics',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090730/brand_images/lfrfcblzejpbiik3ns6v.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '97',
      name: 'Zivame',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090731/brand_images/ru2pzzsltesfa5ewgynx.png',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '98',
      name: 'Zudio',
      image:
          'https://res.cloudinary.com/del2emuqb/image/upload/v1769090733/brand_images/upzaqvb9finty4k161bj.png',
      productsCount: 1,
      isFeatured: true,
    ),
  ];

  ///-----List of all products-------

  static final List<ProductModel> products = [
    // --- 1. ADIDAS (Brand ID: 1 | Index 0) ---
    ProductModel(
      id: 'p1',
      title: 'Adidas Ultraboost Running Shoes',
      stock: 20,
      price: 1800,
      salePrice: 1624,
      isFeatured: true,
      thumbnail: UImages.adidasUltraboostRunningShoes,
      images: [
        UImages.adidasUltraboostRunningShoesBlack,
        UImages.adidasUltraboostRunningShoesWhite,
      ],
      description:
          'Experience ultimate energy return with the Adidas Ultraboost running shoes. Engineered with a Primeknit upper that adapts to the changing shape of your foot, these shoes offer unparalleled comfort and support. The responsive Boost midsole cushioning delivers incredible energy return with every step, making them perfect for long-distance runs or daily wear.',
      brand: brands[0],
      categoryId: '22',
      sku: 'ADI-UB-001',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v1',
          price: 1800,
          salePrice: 1624,
          stock: 5,
          image: UImages.adidasUltraboostRunningShoesBlack,
          attributeValues: {'Color': 'Black'},
          description:
              'Sleek black edition with reflective details for night runs.',
        ),
        ProductVariationModel(
          id: 'v2',
          price: 1624,
          stock: 8,
          image: UImages.adidasUltraboostRunningShoesWhite,
          attributeValues: {'Color': 'White'},
          description: 'Clean white colorway perfect for summer training.',
        ),
      ],
    ),
    ProductModel(
      id: 'p2',
      title: 'Adidas Men\'s Track Pants',
      stock: 15,
      price: 1200,
      salePrice: 999,
      isFeatured: false,
      thumbnail: UImages.adidasMensTrackPants,
      description:
          'Stay comfortable during your workouts or while lounging at home with these Adidas Men\'s Track Pants. Made from soft, breathable fabric, they feature a tapered fit for a modern look and zippered pockets to keep your essentials safe. The elastic waistband with a drawcord ensures a customizable and secure fit.',
      brand: brands[0],
      categoryId: '19',
      sku: 'ADI-TP-002',
      productType: 'ProductType.single',
    ),

    // --- 2. AJMAL (Brand ID: 2 | Index 1) ---
    ProductModel(
      id: 'p3',
      title: 'Ajmal Wisal Perfume 100ml',
      stock: 25,
      price: 2499,
      isFeatured: true,
      thumbnail: UImages.ajmalWisalPerfume100ml,
      description:
          'Ajmal Wisal is an inviting fragrance that features fresh floral top notes combined with a spicy floral heart and a musky floral base. Designed for the modern woman who is strong yet feminine, this long-lasting perfume leaves a captivating trail wherever you go. Ideal for evening wear and special occasions.',
      brand: brands[1],
      categoryId: '13',
      sku: 'AJM-WS-003',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p4',
      title: 'Ajmal Blu Cologne',
      stock: 30,
      price: 1500,
      isFeatured: false,
      thumbnail: UImages.ajmalBluCologne,
      description:
          'Dive into freshness with Ajmal Blu Cologne. This aquatic fragrance for men combines zesty citrus top notes with a cool, marine heart and a woody base. Perfect for the active man, it offers a refreshing burst of energy that lasts all day, making it an excellent choice for summer days or post-gym refreshment.',
      brand: brands[1],
      categoryId: '13',
      sku: 'AJM-BL-004',
      productType: 'ProductType.single',
    ),

    // --- 3. ALLEN SOLLY (Brand ID: 3 | Index 2) ---
    ProductModel(
      id: 'p5',
      title: 'Allen Solly Formal Shirt',
      stock: 30,
      price: 1899,
      salePrice: 1039,
      thumbnail: UImages.allenSollyFormalShirt,
      images: [
        UImages.allenSollyFormalShirtWhite,
        UImages.allenSollyFormalShirtBlue,
      ],
      isFeatured: true,
      description:
          'Make a lasting impression in the boardroom with this crisp Allen Solly Formal Shirt. Crafted from 100% premium cotton, it offers a breathable and comfortable fit for long office hours. The slim-fit design provides a sharp, tailored silhouette that pairs perfectly with formal trousers or chinos.',
      brand: brands[2],
      categoryId: '17',
      sku: 'AS-FS-005',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v3',
          price: 1039,
          stock: 10,
          image: UImages.allenSollyFormalShirtWhite,
          attributeValues: {'Color': 'White'},
          description:
              'Classic white shirt, a wardrobe staple for every professional.',
        ),
        ProductVariationModel(
          id: 'v4',
          price: 1039,
          stock: 12,
          image: UImages.allenSollyFormalShirtBlue,
          attributeValues: {'Color': 'Blue'},
          description:
              'Sophisticated light blue shirt for a calm and confident look.',
        ),
      ],
    ),
    ProductModel(
      id: 'p6',
      title: 'Allen Solly Chinos',
      stock: 20,
      price: 1499,
      isFeatured: false,
      thumbnail: UImages.allenSollyChinos,
      description:
          'Upgrade your casual Friday look with these stylish Allen Solly Chinos. Made from a durable cotton-stretch blend, they offer superior comfort and flexibility. The beige color is versatile enough to match with polo t-shirts or casual button-downs, making them a must-have for your smart-casual wardrobe.',
      brand: brands[2],
      categoryId: '19',
      sku: 'AS-CH-006',
      productType: 'ProductType.single',
    ),

    // --- 4. AMBRANE (Brand ID: 4 | Index 3) ---
    ProductModel(
      id: 'p7',
      title: 'Ambrane 20000mAh Powerbank',
      stock: 40,
      price: 1999,
      salePrice: 1299,
      isFeatured: true,
      thumbnail: UImages.ambrane20000mahPowerbank,
      description:
          'Stay charged on the go with the powerful Ambrane 20000mAh Powerbank. Featuring dual USB output ports and 22.5W fast charging technology, it can charge two devices simultaneously at high speed. Its compact, scratch-resistant design makes it a durable travel companion for your smartphones, tablets, and other gadgets.',
      brand: brands[3],
      categoryId: '4',
      sku: 'AMB-PB-007',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p8',
      title: 'Ambrane USB-C Cable',
      stock: 100,
      price: 499,
      thumbnail: UImages.ambraneUsbCCable,
      isFeatured: false,
      description:
          'Experience rapid data transfer and fast charging with the Ambrane USB-C Cable. Constructed with a tough braided nylon exterior, this cable is designed to withstand daily wear and tear. Its enhanced durability ensures a long lifespan, while the high-quality copper core guarantees stable and efficient performance.',
      brand: brands[3],
      categoryId: '4',
      sku: 'AMB-CB-008',
      productType: 'ProductType.single',
    ),

    // --- 5. AMERICAN TOURISTER (Brand ID: 5 | Index 4) ---
    ProductModel(
      id: 'p9',
      title: 'American Tourister Hardshell Luggage',
      stock: 10,
      price: 7461,
      salePrice: 4999,
      isFeatured: true,
      thumbnail: UImages.americanTouristerHardshellLuggage,
      images: [UImages.americanTouristerHardshellLuggage],
      description:
          'Travel with confidence using the American Tourister Hardshell Luggage. This robust cabin-size suitcase features a scratch-resistant exterior and a secure TSA lock to keep your belongings safe. The smooth 360-degree spinner wheels ensure effortless maneuverability through busy airports, while the organized interior compartments make packing a breeze.',
      brand: brands[4],
      categoryId: '2',
      sku: 'AT-HL-009',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p10',
      title: 'American Tourister Backpack',
      stock: 25,
      price: 1599,
      isFeatured: true,
      thumbnail: UImages.americanTouristerBackpack,
      description:
          'The American Tourister Backpack is the perfect blend of style and functionality for students and professionals. It features a spacious main compartment, a dedicated padded laptop sleeve, and multiple front pockets for easy organization. The ergonomic shoulder straps and padded back panel provide all-day comfort during your commute.',
      brand: brands[4],
      categoryId: '2',
      sku: 'AT-BP-010',
      productType: 'ProductType.single',
    ),

    // --- 6. ARISTOCRAT (Brand ID: 6 | Index 5) ---
    ProductModel(
      id: 'p11',
      title: 'Aristocrat Soft-Sided Suitcase',
      stock: 12,
      price: 4500,
      salePrice: 2799,
      thumbnail: UImages.aristocratSoftSidedSuitcase,
      isFeatured: true,
      description:
          'Pack more for your trips with the Aristocrat Soft-Sided Suitcase. Made from durable polyester fabric, this lightweight luggage offers expandability for extra packing space. It comes with corner guards for added protection and smooth-rolling wheels for easy transport. Ideal for family vacations and business trips alike.',
      brand: brands[5],
      categoryId: '2',
      sku: 'ARI-SS-011',
      productType: 'ProductType.single',
    ),

    // --- 7. AURELIA (Brand ID: 7 | Index 6) ---
    ProductModel(
      id: 'p12',
      title: 'Aurelia Printed Kurti',
      stock: 15,
      price: 1599,
      salePrice: 999,
      thumbnail: UImages.aureliaPrintedKurti,
      isFeatured: true,
      description:
          ' embrace ethnic elegance with this stunning Aurelia Printed Kurti. Featuring intricate traditional block prints on soft, breathable fabric, this kurti is perfect for daily wear or casual outings. The straight-cut design offers a flattering fit, and it pairs beautifully with leggings or palazzos for a complete look.',
      brand: brands[6],
      categoryId: '27',
      sku: 'AUR-PK-012',
      productType: 'ProductType.variable',
      images: [],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'Red']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v5',
          price: 999,
          stock: 5,
          image: UImages.aureliaPrintedKurtiBlue,
          attributeValues: {'Color': 'Blue'},
          description: 'Cool blue hues with geometric patterns.',
        ),
        ProductVariationModel(
          id: 'v6',
          price: 999,
          stock: 6,
          image: UImages.aureliaPrintedKurtiRed,
          attributeValues: {'Color': 'Red'},
          description: 'Vibrant red with floral motifs for a festive touch.',
        ),
      ],
    ),
    ProductModel(
      id: 'p13',
      title: 'Aurelia Palazzo Set',
      stock: 10,
      price: 2199,
      isFeatured: false,
      thumbnail: UImages.aureliaPalazzoSet,
      description:
          'Step out in style with this chic Aurelia Palazzo Set. The set includes a beautifully printed kurta and matching wide-leg palazzos, offering both comfort and fashion. Made from premium rayon fabric, it drapes elegantly and keeps you cool. Perfect for festive gatherings or summer parties.',
      brand: brands[6],
      categoryId: '27',
      sku: 'AUR-PS-013',
      productType: 'ProductType.single',
    ),

    // --- 8. BABYHUG (Brand ID: 8 | Index 7) ---
    ProductModel(
      id: 'p14',
      title: 'Babyhug Cotton Romper',
      stock: 50,
      price: 799,
      salePrice: 319,
      thumbnail: UImages.babyhugCottonRomper,
      isFeatured: true,
      description:
          'Ensure your baby\'s comfort with this adorable Babyhug Cotton Romper. Crafted from 100% organic cotton, it is gentle on delicate skin and breathable for all-day wear. The convenient snap-button closure makes diaper changes quick and easy, while the cute prints add a touch of joy to your little one\'s wardrobe.',
      brand: brands[7],
      categoryId: '31',
      sku: 'BH-CR-014',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p15',
      title: 'Babyhug Feeding Bottle',
      stock: 60,
      price: 299,
      isFeatured: false,
      thumbnail: UImages.babyhugFeedingBottle,
      description:
          'The Babyhug Feeding Bottle is designed to mimic natural breastfeeding, making it easier for your baby to switch between breast and bottle. It features an anti-colic venting system to reduce air intake and discomfort. Made from BPA-free, high-quality plastic, it is safe, durable, and easy to clean.',
      brand: brands[7],
      categoryId: '31',
      sku: 'BH-FB-015',
      productType: 'ProductType.single',
    ),

    // --- 9. BEARDO (Brand ID: 9 | Index 8) ---
    ProductModel(
      id: 'p16',
      title: 'Beardo Beard Growth Oil',
      stock: 80,
      price: 1299,
      salePrice: 1013,
      isFeatured: true,
      thumbnail: UImages.beardoBeardGrowthOil,
      description:
          'Achieve the beard of your dreams with Beardo Beard Growth Oil. Formulated with a potent blend of natural oils like Hibiscus, Amla, and Coconut, it nourishes the roots and promotes faster, thicker hair growth. Regular use helps to condition the beard, reduce itchiness, and fill in patchy areas.',
      brand: brands[8],
      categoryId: '15',
      sku: 'BRD-BG-016',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p17',
      title: 'Beardo Charcoal Facewash',
      stock: 100,
      price: 250,
      isFeatured: false,
      thumbnail: UImages.beardoCharcoalFacewash,
      description:
          'Detoxify your skin with Beardo Charcoal Facewash. Infused with activated charcoal, it acts like a magnet to draw out deep-seated dirt, oil, and pollution from your pores. This powerful cleanser helps to control acne, reduce dark spots, and leaves your skin feeling fresh, bright, and rejuvenated after every wash.',
      brand: brands[8],
      categoryId: '15',
      sku: 'BRD-CF-017',
      productType: 'ProductType.single',
    ),

    // --- 10. BELLA VITA (Brand ID: 10 | Index 9) ---
    ProductModel(
      id: 'p18',
      title: 'Bella Vita Luxury Gift Set',
      stock: 20,
      price: 1200,
      isFeatured: true,
      thumbnail: UImages.bellaVitaLuxuryGiftSet,
      description:
          'Discover your signature scent with the Bella Vita Luxury Gift Set. This exclusive collection features four premium, long-lasting perfumes suitable for men and women. From fresh aquatic notes to deep woody aromas, this set offers a fragrance for every mood and occasion. Ideally packaged for gifting.',
      brand: brands[9],
      categoryId: '13',
      sku: 'BV-GS-018',
      productType: 'ProductType.single',
    ),

    // --- 11. BIBA (Brand ID: 11 | Index 10) ---
    ProductModel(
      id: 'p19',
      title: 'Biba Anarkali Suit',
      stock: 10,
      price: 3499,
      isFeatured: true,
      thumbnail: UImages.bibaAnarkaliSuit,
      description:
          'Radiate traditional charm in this exquisite Biba Anarkali Suit. Featuring elaborate embroidery and a flowing silhouette, this suit is crafted from rich fabric that ensures a regal look. Perfect for weddings and festivals, it comes with a matching dupatta and churidar to complete the ethnic ensemble.',
      brand: brands[10],
      categoryId: '23',
      sku: 'BIB-AS-019',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p20',
      title: 'Biba Cotton Dupatta',
      stock: 30,
      price: 599,
      isFeatured: false,
      thumbnail: UImages.bibaCottonDupatta,
      description:
          'Add a splash of color to your outfit with this beautiful Biba Cotton Dupatta. Soft, lightweight, and easy to carry, it features vibrant prints and delicate borders. It pairs wonderfully with solid-colored kurtis or salwar suits, making it a versatile accessory for your daily ethnic wardrobe.',
      brand: brands[10],
      categoryId: '27',
      sku: 'BIB-CD-020',
      productType: 'ProductType.single',
    ),

    // --- 12. BIOTIQUE (Brand ID: 12 | Index 11) ---
    ProductModel(
      id: 'p21',
      title: 'Biotique Neem Face Wash',
      stock: 100,
      price: 250,
      isFeatured: true,
      thumbnail: UImages.biotiqueNeemFaceWash,
      description:
          'Purify your skin naturally with Biotique Bio Neem Face Wash. This soap-free herbal formula is blended with extracts of Neem, Ritha, and Kulanjan to gently wash away impurities and prevent pimples. It soothes sensitive skin and leaves your complexion looking fresh, clear, and problem-free.',
      brand: brands[11],
      categoryId: '10',
      sku: 'BIO-NF-021',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p22',
      title: 'Biotique Shampoo',
      stock: 80,
      price: 299,
      isFeatured: true,
      thumbnail: UImages.biotiqueShampoo,
      description:
          'Revitalize your hair with Biotique Bio Green Apple Shampoo. Enriched with natural minerals and proteins, this refreshing formula purifies and nourishes the scalp. It adds body and shine to oily hair and leaves it feeling light and bouncy. Gentle enough for daily use.',
      brand: brands[11],
      categoryId: '12',
      sku: 'BIO-SH-022',
      productType: 'ProductType.single',
    ),

    // --- 13. BLUE HEAVEN (Brand ID: 13 | Index 12) ---
    ProductModel(
      id: 'p23',
      title: 'Blue Heaven Kajal',
      stock: 200,
      price: 150,
      isFeatured: false,
      thumbnail: UImages.blueHeavenKajal,
      description:
          'Define your eyes with the intense black Blue Heaven Kajal. Its herbal formula is enriched with Vitamin E to soothe and cool your eyes. Smudge-proof and water-resistant, this retractable pencil glides on smoothly to give you a bold, dramatic look that lasts all day without fading.',
      brand: brands[12],
      categoryId: '11',
      sku: 'BH-KJ-023',
      productType: 'ProductType.single',
    ),

    // --- 14. BOAT (Brand ID: 14 | Index 13) ---
    ProductModel(
      id: 'p24',
      title: 'Boat Rockerz 450',
      stock: 30,
      price: 2999,
      salePrice: 1499,
      thumbnail: UImages.boatRockerz450,
      isFeatured: true,
      description:
          'Immerse yourself in HD sound with the Boat Rockerz 450 Wireless Headphones. Equipped with 40mm dynamic drivers, they deliver punchy bass and crystal-clear vocals. With a battery life of up to 15 hours and plush ear cushions, you can enjoy uninterrupted music in total comfort.',
      brand: brands[13],
      categoryId: '4',
      sku: 'BT-RZ-024',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p25',
      title: 'Boat Airdopes 141',
      stock: 50,
      price: 1999,
      salePrice: 1299,
      isFeatured: false,
      thumbnail: UImages.boatAirdopes141,
      description:
          'Experience true wireless freedom with Boat Airdopes 141. These earbuds feature ENx technology for clear calls and Beast Mode for low latency gaming. With a massive playback time of up to 42 hours including the case, and ASAP Charge feature, you never have to worry about running out of battery.',
      brand: brands[13],
      categoryId: '4',
      sku: 'BT-AD-025',
      productType: 'ProductType.single',
    ),

    // --- 15. BOMBAY SHAVING COMPANY (Brand ID: 15 | Index 14) ---
    ProductModel(
      id: 'p26',
      title: 'Bombay Shaving Charcoal Soap',
      stock: 45,
      price: 299,
      isFeatured: true,
      thumbnail: UImages.bombayShavingCharcoalSoap,
      description:
          'Upgrade your shower routine with the handmade Bombay Shaving Company Charcoal Soap. Infused with activated charcoal, it deep cleanses pores and removes dirt and excess oil. Enriched with cocoa butter and glycerin, it ensures your skin remains moisturized and soft, never dry, after every wash.',
      brand: brands[14],
      categoryId: '16',
      sku: 'BSC-CS-026',
      productType: 'ProductType.single',
    ),

    // --- 16. CAMPUS SUTRA (Brand ID: 16 | Index 15) ---
    ProductModel(
      id: 'p27',
      title: 'Campus Sutra Hoodie',
      stock: 15,
      price: 1200,
      salePrice: 899,
      isFeatured: true,
      thumbnail: UImages.campusSutraHoodie,
      images: [UImages.campusSutraHoodieGrey, UImages.campusSutraHoodieBlack],
      description:
          'Stay cozy and trendy with this Campus Sutra Men\'s Hoodie. Made from high-quality fleece fabric, it provides excellent warmth during chilly days. The modern design features a kangaroo pocket and a comfortable hood with drawstrings. Perfect for casual outings or layering over a t-shirt.',
      brand: brands[15],
      categoryId: '21',
      sku: 'CS-HD-027',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Grey', 'Black']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v7',
          price: 899,
          stock: 5,
          image: UImages.campusSutraHoodieGrey,
          attributeValues: {'Color': 'Grey'},
          description: 'Classic grey melange for a sporty look.',
        ),
        ProductVariationModel(
          id: 'v8',
          price: 899,
          stock: 8,
          image: UImages.campusSutraHoodieBlack,
          attributeValues: {'Color': 'Black'},
          description: 'Versatile black hoodie that goes with everything.',
        ),
      ],
    ),
    ProductModel(
      id: 'p28',
      title: 'Campus Sutra Joggers',
      stock: 20,
      price: 999,
      isFeatured: false,
      thumbnail: UImages.campusSutraJoggers,
      description:
          'Relax in style with these Campus Sutra Cotton Joggers. Designed with a slim tapered fit and ribbed cuffs, they offer a modern silhouette without compromising on comfort. Whether you are hitting the gym or lounging at home, the breathable fabric and elastic waistband ensure ease of movement.',
      brand: brands[15],
      categoryId: '19',
      sku: 'CS-JG-028',
      productType: 'ProductType.single',
    ),

    // --- 17. COLORBAR (Brand ID: 17 | Index 16) ---
    ProductModel(
      id: 'p29',
      title: 'Colorbar Matte Lipstick',
      stock: 60,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.colorbarMatteLipstick,
      description:
          'Get the perfect pout with Colorbar Velvet Matte Lipstick. Its creamy texture glides on effortlessly to deliver a rich, intense matte color that stays put for hours. Enriched with Vitamin E and shea butter, it keeps your lips hydrated and prevents them from drying out.',
      brand: brands[16],
      categoryId: '11',
      sku: 'CB-ML-029',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Shade', values: ['Red', 'Nude']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v9',
          price: 499,
          stock: 20,
          image: UImages.colorbarMatteLipstickRed,
          attributeValues: {'Shade': 'Red'},
          description: 'Bold and fiery red for a statement look.',
        ),
        ProductVariationModel(
          id: 'v10',
          price: 499,
          stock: 15,
          image: UImages.colorbarMatteLipstickNude,
          attributeValues: {'Shade': 'Nude'},
          description: 'Subtle nude shade for everyday elegance.',
        ),
      ],
    ),

    // --- 18. DECATHLON (Brand ID: 18 | Index 17) ---
    ProductModel(
      id: 'p30',
      title: 'Decathlon Sport T-Shirt',
      stock: 100,
      price: 599,
      isFeatured: true,
      thumbnail: UImages.decathlonSportTshirt,
      description:
          'Train harder with the Decathlon Sport T-Shirt. Engineered with moisture-wicking fabric, it pulls sweat away from your skin to keep you dry and comfortable during intense workouts. The lightweight and breathable material ensures maximum freedom of movement for running or gym sessions.',
      brand: brands[17],
      categoryId: '18',
      sku: 'DEC-ST-030',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p31',
      title: 'Decathlon Yoga Mat',
      stock: 40,
      price: 899,
      isFeatured: false,
      thumbnail: UImages.decathlonYogaMat,
      description:
          'Find your balance with the Decathlon Yoga Mat. This 6mm thick mat provides excellent cushioning and support for your joints during yoga and pilates. Its textured non-slip surface ensures stability in every pose, while the lightweight design and carry strap make it easy to transport to class.',
      brand: brands[17],
      categoryId: '18',
      sku: 'DEC-YM-031',
      productType: 'ProductType.single',
    ),

    // --- 19. DENVER (Brand ID: 19 | Index 18) ---
    ProductModel(
      id: 'p32',
      title: 'Denver Hamilton Deo',
      stock: 80,
      price: 250,
      isFeatured: true,
      thumbnail: UImages.denverHamiltonDeo,
      description:
          'Exude confidence with Denver Hamilton Deodorant. This classic masculine fragrance features a blend of aromatic and woody notes that keeps body odor at bay. Its long-lasting formula ensures you stay fresh and smelling great throughout the day, making it an essential part of your grooming kit.',
      brand: brands[18],
      categoryId: '13',
      sku: 'DEN-HD-032',
      productType: 'ProductType.single',
    ),

    // --- 20. ELLE 18 (Brand ID: 20 | Index 19) ---
    ProductModel(
      id: 'p33',
      title: 'Elle 18 Nail Pops',
      stock: 150,
      price: 99,
      isFeatured: true,
      thumbnail: UImages.elle18NailPops,
      description:
          'Add a pop of color to your nails with Elle 18 Nail Pops. Available in a wide range of vibrant, trendy shades, these nail polishes offer a glossy finish and quick drying time. The convenient small bottle size allows you to experiment with different colors for every outfit and mood.',
      brand: brands[19],
      categoryId: '14',
      sku: 'E18-NP-033',
      productType: 'ProductType.single',
    ),

    // --- 21. ENGAGE (Brand ID: 21 | Index 20) ---
    ProductModel(
      id: 'p34',
      title: 'Engage Pocket Perfume',
      stock: 100,
      price: 60,
      isFeatured: true,
      thumbnail: UImages.engagePocketPerfume,
      description:
          'Stay fresh on the move with Engage Pocket Perfume. This credit-card-sized perfume fits easily into your pocket or purse, making it perfect for quick touch-ups. With approximately 250 sprays of intense, long-lasting fragrance, it ensures you are always ready for unexpected moments.',
      brand: brands[20],
      categoryId: '13',
      sku: 'ENG-PP-034',
      productType: 'ProductType.single',
    ),

    // --- 22. FACES CANADA (Brand ID: 22 | Index 21) ---
    ProductModel(
      id: 'p35',
      title: 'Faces Canada Foundation',
      stock: 40,
      price: 799,
      isFeatured: true,
      thumbnail: UImages.facesCanadaFoundation,
      description:
          'Achieve a flawless complexion with Faces Canada Weightless Matte Finish Foundation. This ultra-lightweight formula blends seamlessly into the skin to provide medium to buildable coverage. Enriched with grape extract and shea butter, it nourishes your skin while delivering a natural, matte look that lasts all day.',
      brand: brands[21],
      categoryId: '11',
      sku: 'FC-FD-035',
      productType: 'ProductType.single',
    ),

    // --- 23. F GEAR (Brand ID: 23 | Index 22) ---
    ProductModel(
      id: 'p36',
      title: 'F Gear Laptop Backpack',
      stock: 25,
      price: 1599,
      isFeatured: true,
      thumbnail: UImages.fGearLaptopBackpack,
      description:
          'Protect your tech in style with the F Gear Laptop Backpack. Designed with a dedicated padded sleeve for laptops up to 15.6 inches, it offers superior protection against bumps. With multiple compartments, water-resistant fabric, and ergonomic shoulder straps, it is ideal for college students and office commuters.',
      brand: brands[22],
      categoryId: '2',
      sku: 'FG-LB-036',
      productType: 'ProductType.single',
    ),

    // --- 24. FIAMA (Brand ID: 24 | Index 23) ---
    ProductModel(
      id: 'p37',
      title: 'Fiama Gel Bar',
      stock: 70,
      price: 350,
      isFeatured: true,
      thumbnail: UImages.fiamaGelBar,
      description:
          'Pamper yourself with the Fiama Di Wills Gel Bar. Infused with skin conditioners and natural extracts like peach and avocado, this unique gel soap lathers richly to cleanse your skin without drying it out. It leaves your skin feeling soft, moisturized, and refreshed with a lingering fruity fragrance.',
      brand: brands[23],
      categoryId: '16',
      sku: 'FIA-GB-037',
      productType: 'ProductType.single',
    ),

    // --- 25. FIRSTCRY (Brand ID: 25 | Index 24) ---
    ProductModel(
      id: 'p38',
      title: 'Firstcry Baby Diapers',
      stock: 120,
      price: 999,
      isFeatured: true,
      thumbnail: UImages.firstcryBabyDiapers,
      description:
          'Keep your baby dry and happy with Firstcry Premium Baby Diapers. Featuring a super-absorbent core that locks away wetness for up to 12 hours, they ensure a peaceful sleep for your little one. The soft, breathable material and stretchable waistband provide a comfortable, rash-free fit.',
      brand: brands[24],
      categoryId: '31',
      sku: 'FC-BD-038',
      productType: 'ProductType.single',
    ),

    // --- 26. FOGG (Brand ID: 26 | Index 25) ---
    ProductModel(
      id: 'p39',
      title: 'Fogg Dynamic Scent',
      stock: 90,
      price: 350,
      isFeatured: true,
      thumbnail: UImages.adidasUltraboostRunningShoes,
      description:
          'Make a statement with Fogg Dynamic Scent for Men. Unlike regular deodorants, this perfume body spray contains no gas and offers 100% perfume liquid for more sprays per bottle. Its intense, masculine fragrance lingers for hours, keeping you fresh and confident through busy days.',
      brand: brands[25],
      categoryId: '13',
      sku: 'FOG-DS-039',
      productType: 'ProductType.single',
    ),

    // --- 27. FOREST ESSENTIALS (Brand ID: 27 | Index 26) ---
    ProductModel(
      id: 'p40',
      title: 'Forest Essentials Mist',
      stock: 15,
      price: 2500,
      isFeatured: true,
      thumbnail: UImages.forestEssentialsMist,
      description:
          'Refresh and hydrate your skin with Forest Essentials Body Mist. Prepared with pure essential oils and floral waters, this Ayurvedic mist provides a cooling sensation and a delicate, natural fragrance. Free from alcohol and synthetic chemicals, it softens the skin and uplifts the senses.',
      brand: brands[26],
      categoryId: '13',
      sku: 'FE-BM-040',
      productType: 'ProductType.single',
    ),

    // --- 28. GILLETTE (Brand ID: 28 | Index 27) ---
    ProductModel(
      id: 'p41',
      title: 'Gillette Mach 3 Razor',
      stock: 100,
      price: 450,
      isFeatured: true,
      thumbnail: UImages.gilletteMach3Razor,
      description:
          'Experience a closer shave with less irritation using the Gillette Mach 3 Razor. It features 3 DuraComfort blades for long-lasting sharpness and a lubrication strip that glides to protect against redness. The ergonomic handle ensures a secure grip for precise control during every shave.',
      brand: brands[27],
      categoryId: '15',
      sku: 'GIL-M3-041',
      productType: 'ProductType.single',
    ),

    // --- 29. GINI & JONY (Brand ID: 29 | Index 28) ---
    ProductModel(
      id: 'p42',
      title: 'Gini & Jony Kids Jeans',
      stock: 20,
      price: 1499,
      salePrice: 599,
      thumbnail: UImages.giniJonyKidsJeans,
      isFeatured: true,
      description:
          'Update your kid\'s wardrobe with these stylish Gini & Jony Jeans. Made from high-quality denim with a hint of stretch, they offer durability and freedom of movement for active play. The adjustable waistband ensures a perfect fit as your child grows, making them a practical choice for everyday wear.',
      brand: brands[28],
      categoryId: '29',
      sku: 'GJ-KJ-042',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p43',
      title: 'Gini & Jony Graphic Tee',
      stock: 30,
      price: 699,
      isFeatured: false,
      thumbnail: UImages.giniJonyGraphicTee,
      description:
          'Add fun vibes to your child\'s outfit with this Gini & Jony Graphic T-Shirt. Crafted from soft, breathable cotton jersey, it keeps kids cool and comfortable all day. The bright colors and playful prints make it a favorite for casual outings and playdates.',
      brand: brands[28],
      categoryId: '29',
      sku: 'GJ-GT-043',
      productType: 'ProductType.single',
    ),

    // --- 30. GOOD VIBES (Brand ID: 30 | Index 29) ---
    ProductModel(
      id: 'p44',
      title: 'Good Vibes Rose Toner',
      stock: 55,
      price: 175,
      isFeatured: true,
      thumbnail: UImages.goodVibesRoseToner,
      description:
          'Revitalize your skin with the soothing Good Vibes Rose Glow Toner. Infused with the essence of fresh roses, it helps to balance skin pH, tighten pores, and provide instant hydration. Alcohol-free and gentle, it leaves your skin feeling refreshed, soft, and glowing.',
      brand: brands[29],
      categoryId: '10',
      sku: 'GV-RT-044',
      productType: 'ProductType.single',
    ),

    // --- 31. HIMALAYA (Brand ID: 31 | Index 30) ---
    ProductModel(
      id: 'p45',
      title: 'Himalaya Neem Face Wash',
      stock: 120,
      price: 199,
      isFeatured: true,
      thumbnail: UImages.himalayaNeemFaceWash,
      description:
          'Fight acne and prevent pimples with Himalaya Purifying Neem Face Wash. This soap-free herbal formulation contains Neem and Turmeric, known for their antibacterial and antifungal properties. It deep cleanses impurities and excess oil without stripping the skin\'s natural moisture.',
      brand: brands[30],
      categoryId: '10',
      sku: 'HIM-NF-045',
      productType: 'ProductType.single',
    ),

    // --- 32. HOPKIDS (Brand ID: 32 | Index 31) ---
    ProductModel(
      id: 'p46',
      title: 'Hopkids Baby Mittens',
      stock: 80,
      price: 150,
      isFeatured: true,
      thumbnail: UImages.hopkidsBabyMittens,
      description:
          'Protect your newborn from scratching themselves with these soft Hopkids Baby Mittens. Made from 100% pure cotton, they are gentle on sensitive skin and breathable. The gentle elastic wristbands ensure they stay comfortably in place while keeping tiny hands warm.',
      brand: brands[31],
      categoryId: '31',
      sku: 'HK-BM-046',
      productType: 'ProductType.single',
    ),

    // --- 33. HOPSCOTCH (Brand ID: 33 | Index 32) ---
    ProductModel(
      id: 'p47',
      title: 'Hopscotch Party Dress',
      stock: 20,
      price: 1599,
      isFeatured: true,
      thumbnail: UImages.hopscotchPartyDress,
      description:
          'Let your little girl shine in this beautiful Hopscotch Party Dress. Featuring delicate sequins, a fluffy tulle skirt, and a comfortable lining, it is perfect for birthdays and special occasions. The premium fabric ensures she stays comfortable while looking like a princess.',
      brand: brands[32],
      categoryId: '30',
      sku: 'HS-PD-047',
      productType: 'ProductType.single',
    ),

    // --- 34. HRX (Brand ID: 34 | Index 33) ---
    ProductModel(
      id: 'p48',
      title: 'HRX Training Shoes',
      stock: 35,
      price: 1999,
      isFeatured: true,
      thumbnail: UImages.hrxTrainingShoes,
      description:
          'Push your limits with HRX Men\'s Training Shoes. Designed for high-intensity workouts, they feature a breathable mesh upper and a cushioned EVA midsole for shock absorption. The durable rubber outsole provides excellent traction, keeping you stable during lifting or cardio sessions.',
      brand: brands[33],
      categoryId: '22',
      sku: 'HRX-TS-048',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p49',
      title: 'HRX Dry-Fit T-Shirt',
      stock: 50,
      price: 799,
      isFeatured: true,
      thumbnail: UImages.hrxDryFitTshirt,
      description:
          'Stay cool and dry during your run with the HRX Dry-Fit T-Shirt. Made with rapid-dry technology, this tee wicks away sweat efficiently. The lightweight fabric and athletic fit ensure unrestricted movement, making it an essential piece of gear for any fitness enthusiast.',
      brand: brands[33],
      categoryId: '18',
      sku: 'HRX-DT-049',
      productType: 'ProductType.single',
    ),

    // --- 35. INDULEKHA (Brand ID: 35 | Index 34) ---
    ProductModel(
      id: 'p50',
      title: 'Indulekha Bringha Oil',
      stock: 45,
      price: 430,
      isFeatured: true,
      thumbnail: UImages.indulekhaBringhaOil,
      description:
          'Combating hair fall is easier with Indulekha Bringha Oil. This proprietary Ayurvedic medicine is prepared with Bringharaj and Swetakutaja. It comes with a unique "Selfie Comb" applicator that delivers the medicinal oil directly to the scalp roots, promoting new hair growth and reducing dandruff.',
      brand: brands[34],
      categoryId: '12',
      sku: 'IND-BO-050',
      productType: 'ProductType.single',
    ),

    // --- 36. INSIGHT (Brand ID: 36 | Index 35) ---
    ProductModel(
      id: 'p51',
      title: 'Insight 3-in-1 Primer',
      stock: 100,
      price: 250,
      isFeatured: true,
      thumbnail: UImages.insight3In1Primer,
      description:
          'Create a flawless base for your makeup with Insight 3-in-1 Primer. This oil-free gel formula primes, protects, and moisturizes your skin. It fills in fine lines and pores, creating a smooth canvas that helps your foundation glide on easily and stay fresh for longer hours.',
      brand: brands[35],
      categoryId: '11',
      sku: 'INS-PR-051',
      productType: 'ProductType.single',
    ),

    // --- 37. JUST HERBS (Brand ID: 37 | Index 36) ---
    ProductModel(
      id: 'p52',
      title: 'Just Herbs Lip Tint',
      stock: 60,
      price: 495,
      isFeatured: true,
      thumbnail: UImages.justHerbsLipTint,
      description:
          'Get a natural flush of color with Just Herbs Lip & Cheek Tint. Enriched with wholesome ingredients like Jojoba oil and Shea butter, this vegan tint moisturizes your lips while adding a buildable pop of color. Free from chemicals and parabens, it is safe for daily use on lips and cheeks.',
      brand: brands[36],
      categoryId: '11',
      sku: 'JH-LT-052',
      productType: 'ProductType.single',
    ),

    // --- 38. KHADI NATURAL (Brand ID: 38 | Index 37) ---
    ProductModel(
      id: 'p53',
      title: 'Khadi Sandalwood Soap',
      stock: 200,
      price: 90,
      isFeatured: true,
      thumbnail: UImages.khadiSandalwoodSoap,
      description:
          'Indulge in the aromatic luxury of Khadi Natural Sandalwood Soap. Handcrafted with pure sandalwood oil and herbal extracts, this soap cleanses and cools the skin. Its antiseptic properties help treat acne and blemishes, leaving your skin soft, glowing, and beautifully scented.',
      brand: brands[37],
      categoryId: '16',
      sku: 'KN-SS-053',
      productType: 'ProductType.single',
    ),

    // --- 39. KILLER (Brand ID: 39 | Index 38) ---
    ProductModel(
      id: 'p54',
      title: 'Killer Skinny Jeans',
      stock: 25,
      price: 2499,
      salePrice: 1699,
      thumbnail: UImages.killerSkinnyJeans,
      isFeatured: true,
      description:
          'Define your style with these edgy Killer Skinny Jeans. Made from premium stretch denim, they offer a snug fit that moves with you. The dark indigo wash and subtle distressing details make them versatile for casual hangouts or night outs. Pair with a tee or shirt for an effortless look.',
      brand: brands[38],
      categoryId: '20',
      sku: 'KIL-SJ-054',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p55',
      title: 'Killer Denim Jacket',
      stock: 15,
      price: 3499,
      isFeatured: true,
      thumbnail: UImages.killerDenimJacket,
      description:
          'Layer up in cool confidence with the Killer Denim Jacket. This classic rugged jacket features durable denim construction, button-down front, and chest pockets. Its timeless design makes it a perfect outer layer for any season, adding a tough, stylish edge to your outfit.',
      brand: brands[38],
      categoryId: '21',
      sku: 'KIL-DJ-055',
      productType: 'ProductType.single',
    ),

    // --- 40. LAKME (Brand ID: 40 | Index 39) ---
    ProductModel(
      id: 'p56',
      title: 'Lakme Sunscreen SPF 50',
      stock: 150,
      price: 350,
      salePrice: 299,
      thumbnail: UImages.lakmeSunscreenSpf50,
      isFeatured: true,
      description:
          'Shield your skin from harsh UV rays with Lakme Sun Expert SPF 50 Gel. This ultra-matte, non-sticky sunscreen absorbs quickly, providing broad-spectrum protection against sunburn and premature aging. Its lightweight formula is perfect for wearing under makeup, keeping your skin protected and oil-free.',
      brand: brands[39],
      categoryId: '10',
      sku: 'LAK-SS-056',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p57',
      title: 'Lakme Eyeconic Kajal',
      stock: 200,
      price: 180,
      thumbnail: UImages.lakmeEyeconicKajal,
      isFeatured: false,
      description:
          'Make your eyes do the talking with Lakme Eyeconic Kajal. This deep black, smudge-proof kajal lasts up to 22 hours. Its ophthalmologically tested formula is safe for contact lens wearers. The easy-twist format allows for a smooth, single-stroke application to define your eyes beautifully.',
      brand: brands[39],
      categoryId: '11',
      sku: 'LAK-EK-057',
      productType: 'ProductType.single',
    ),

    // --- 41. LAVA (Brand ID: 41 | Index 40) ---
    ProductModel(
      id: 'p58',
      title: 'Lava Blaze 5G',
      stock: 15,
      price: 10999,
      isFeatured: true,
      thumbnail: UImages.lavaBlaze5g,
      description:
          'Experience the speed of next-gen connectivity with the Lava Blaze 5G. It features a premium glass back design, a powerful MediaTek Dimensity 700 processor, and a 50MP AI triple camera for stunning photos. With a long-lasting 5000mAh battery and clean Android OS, it offers a smooth and reliable performance at an affordable price.',
      brand: brands[40],
      categoryId: '4',
      sku: 'LAV-B5-058',
      productType: 'ProductType.single',
    ),

    // --- 42. LAVIE SPORT (Brand ID: 42 | Index 41) ---
    ProductModel(
      id: 'p59',
      title: 'Lavie Sport Duffel Bag',
      stock: 20,
      price: 1200,
      isFeatured: true,
      thumbnail: UImages.lavieSportDuffelBag,
      description:
          'Carry your gear in style with the Lavie Sport Duffel Bag. Built with durable, water-resistant polyester, it features a spacious main compartment and a separate shoe pocket to keep your things organized. Ideal for gym sessions or weekend trips, it comes with sturdy handles and an adjustable shoulder strap.',
      brand: brands[41],
      categoryId: '2',
      sku: 'LAV-DB-059',
      productType: 'ProductType.single',
    ),

    // --- 43. LIBAS (Brand ID: 43 | Index 42) ---
    ProductModel(
      id: 'p60',
      title: 'Libas Kurti Set',
      stock: 35,
      price: 1499,
      isFeatured: true,
      thumbnail: UImages.libasKurtiSet,
      description:
          'Embrace effortless elegance with this Libas Cotton Kurti Set. The set includes a beautifully printed straight kurta paired with comfortable palazzo pants. Crafted from high-quality cotton, it ensures breathability and comfort, making it a perfect choice for office wear or casual day outs.',
      brand: brands[42],
      categoryId: '27',
      sku: 'LIB-KS-060',
      productType: 'ProductType.single',
    ),

    // --- 44. LIFEBUOY (Brand ID: 44 | Index 43) ---
    ProductModel(
      id: 'p61',
      title: 'Lifebuoy Handwash',
      stock: 300,
      price: 99,
      isFeatured: true,
      thumbnail: UImages.lifebuoyHandwash,
      description:
          'Keep your family safe from germs with Lifebuoy Total 10 Handwash. Its advanced Activ Silver formula kills 99.9% of germs in just 10 seconds. This easy-to-use refill pouch is economical and ensures your hands remain clean, hygienic, and protected against infections every day.',
      brand: brands[43],
      categoryId: '16',
      sku: 'LB-HW-061',
      productType: 'ProductType.single',
    ),

    // --- 45. LILLIPUT (Brand ID: 45 | Index 44) ---
    ProductModel(
      id: 'p62',
      title: 'Lilliput Baby Suit',
      stock: 40,
      price: 699,
      isFeatured: true,
      thumbnail: UImages.lilliputBabySuit,
      description:
          'Dress your little gentleman in this dashing Lilliput Baby Suit. The set includes a shirt, waistcoat, and trousers tailored from soft, skin-friendly fabric. Perfect for parties and weddings, it ensures your baby boy looks stylish while staying comfortable enough to play all day.',
      brand: brands[44],
      categoryId: '31',
      sku: 'LIL-BS-062',
      productType: 'ProductType.single',
    ),

    // --- 46. LITTLE KANGAROOS (Brand ID: 46 | Index 45) ---
    ProductModel(
      id: 'p63',
      title: 'Little Kangaroos Soft Toy',
      stock: 60,
      price: 450,
      isFeatured: true,
      thumbnail: UImages.littleKangaroosSoftToy,
      description:
          'Delight your child with this cuddly Little Kangaroos Soft Toy. Made from high-quality, non-toxic plush material, it is safe and soft for hugging. This adorable teddy bear is the perfect companion for nap time and imaginative play, making it a wonderful gift for toddlers.',
      brand: brands[45],
      categoryId: '30',
      sku: 'LK-ST-063',
      productType: 'ProductType.single',
    ),

    // --- 47. LOTUS HERBALS (Brand ID: 47 | Index 46) ---
    ProductModel(
      id: 'p64',
      title: 'Lotus Herbals Sunscreen',
      stock: 80,
      price: 295,
      isFeatured: true,
      thumbnail: UImages.lotusHerbalsSunscreen,
      description:
          'Protect your skin with the Lotus Herbals Safe Sun 3-in-1 Matte Look Daily Sunblock. With SPF 40, it offers broad-spectrum UVA and UVB protection. Its tinted, non-greasy formula absorbs quickly to give a smooth, matte finish, doubling as a light foundation for daily wear.',
      brand: brands[46],
      categoryId: '10',
      sku: 'LH-SS-064',
      productType: 'ProductType.single',
    ),

    // --- 48. LOUIS PHILIPPE (Brand ID: 48 | Index 47) ---
    ProductModel(
      id: 'p65',
      title: 'Louis Philippe Leather Belt',
      stock: 25,
      price: 1299,
      isFeatured: true,
      thumbnail: UImages.louisPhilippeLeatherBelt,
      description:
          'Complete your formal attire with this sophisticated Louis Philippe Leather Belt. Crafted from genuine leather, it features a sleek, reversible design with a sturdy metal buckle. Durable and stylish, this belt is an essential accessory for the modern gentleman\'s wardrobe.',
      brand: brands[47],
      categoryId: '6',
      sku: 'LP-LB-065',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p66',
      title: 'Louis Philippe Wallet',
      stock: 30,
      price: 1999,
      isFeatured: true,
      thumbnail: UImages.louisPhilippeWallet,
      description:
          'Carry your essentials in luxury with the Louis Philippe Men\'s Wallet. Made from premium textured leather, this bi-fold wallet features multiple card slots and a spacious currency compartment. Its slim profile fits comfortably in your pocket, combining practicality with timeless elegance.',
      brand: brands[47],
      categoryId: '6',
      sku: 'LP-WL-066',
      productType: 'ProductType.single',
    ),

    // --- 49. LUX (Brand ID: 49 | Index 48) ---
    ProductModel(
      id: 'p67',
      title: 'Lux Beauty Soap',
      stock: 500,
      price: 40,
      isFeatured: true,
      thumbnail: UImages.luxBeautySoap,
      description:
          'Indulge in a luxurious bath with Lux Soft Touch Soap. Infused with French Rose and Almond Oil, it creates a rich, creamy lather that moisturizes your skin. This beauty bar leaves your skin feeling silky soft and smelling irresistibly fragrant for hours after your shower.',
      brand: brands[48],
      categoryId: '16',
      sku: 'LUX-BS-067',
      productType: 'ProductType.single',
    ),

    // --- 50. MAMAEARTH (Brand ID: 50 | Index 49) ---
    ProductModel(
      id: 'p68',
      title: 'Mamaearth Onion Hair Oil',
      stock: 100,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.mamaearthOnionHairOil,
      description:
          'Reduce hair fall and boost regrowth with Mamaearth Onion Hair Oil. Powered by Onion Seed Oil and Redensyl, this lightweight, non-sticky oil strengthens hair roots and nourishes the scalp. Free from harmful silicones and parabens, it is safe for treated hair and suitable for all hair types.',
      brand: brands[49],
      categoryId: '12',
      sku: 'MAM-OH-068',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p69',
      title: 'Mamaearth Ubtan Face Wash',
      stock: 90,
      price: 249,
      isFeatured: true,
      thumbnail: UImages.mamaearthUbtanFaceWash,
      description:
          'Reveal your natural glow with Mamaearth Ubtan Face Wash. Enriched with Turmeric and Saffron, it gently exfoliates to remove tan and impurities. This toxin-free face wash repairs sun damage and brightens skin tone, leaving your face feeling fresh and radiant. Ideal for daily use.',
      brand: brands[49],
      categoryId: '10',
      sku: 'MAM-FW-069',
      productType: 'ProductType.single',
    ),

    // --- 51. MAN ARDEN (Brand ID: 51 | Index 50) ---
    ProductModel(
      id: 'p70',
      title: 'Man Arden Shaving Cream',
      stock: 60,
      price: 249,
      isFeatured: true,
      thumbnail: UImages.manArdenShavingCream,
      description:
          'Enjoy a smooth, frictionless shave with Man Arden Hydrating Shaving Cream. Its rich lather softens the beard stubble, allowing the razor to glide effortlessly. Infused with cooling menthol and moisturizing agents, it prevents razor burns and leaves your skin feeling hydrated and refreshed.',
      brand: brands[50],
      categoryId: '15',
      sku: 'MA-SC-070',
      productType: 'ProductType.single',
    ),

    // --- 52. MARS (Brand ID: 52 | Index 51) ---
    ProductModel(
      id: 'p71',
      title: 'Mars Eyeshadow Palette',
      stock: 35,
      price: 599,
      isFeatured: true,
      thumbnail: UImages.marsEyeshadowPalette,
      description:
          'Unleash your creativity with the Mars Eyeshadow Palette. This 12-shade palette features a mix of highly pigmented matte and shimmer colors. The buttery soft formula blends easily, allowing you to create endless eye looks from subtle day wear to dramatic evening glam. Compact and travel-friendly.',
      brand: brands[51],
      categoryId: '11',
      sku: 'MRS-EP-071',
      productType: 'ProductType.single',
    ),

    // --- 53. MAXX (Brand ID: 53 | Index 52) ---
    ProductModel(
      id: 'p72',
      title: 'Maxx Kids Socks',
      stock: 200,
      price: 150,
      isFeatured: true,
      thumbnail: UImages.maxxKidsSocks,
      description:
          'Keep little feet happy with this pack of Maxx Kids Socks. Made from a soft cotton blend, they provide breathable comfort and absorb sweat. The reinforced heel and toe ensure durability, while the gentle elastic cuffs keep the socks in place without leaving marks. Perfect for school or play.',
      brand: brands[52],
      categoryId: '32',
      sku: 'MAX-KS-072',
      productType: 'ProductType.single',
    ),

    // --- 54. MELANGE (Brand ID: 54 | Index 53) ---
    ProductModel(
      id: 'p73',
      title: 'Melange Straight Kurta',
      stock: 25,
      price: 1199,
      isFeatured: true,
      thumbnail: UImages.melangeStraightKurta,
      description:
          'Elevate your everyday style with this contemporary Melange Straight Kurta. Featuring a modern print and a comfortable round neck, it is tailored from soft viscose fabric. Ideal for casual Fridays or college wear, pair it with contrasting leggings and flats for a chic, effortless look.',
      brand: brands[53],
      categoryId: '27',
      sku: 'MEL-SK-073',
      productType: 'ProductType.single',
    ),

    // --- 55. MI (Brand ID: 55 | Index 54) ---
    ProductModel(
      id: 'p74',
      title: 'Mi Smart Band 7',
      stock: 40,
      price: 2499,
      isFeatured: true,
      thumbnail: UImages.miSmartBand7,
      description:
          'Track your fitness goals with the Mi Smart Band 7. It boasts a large 1.62-inch AMOLED display, continuous SpO2 and heart rate monitoring, and 120+ sports modes. With a 14-day battery life and 5ATM water resistance, it is the ultimate health companion for your active lifestyle.',
      brand: brands[54],
      categoryId: '4',
      sku: 'MI-SB-074',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p75',
      title: 'Mi Trimmer',
      stock: 50,
      price: 1199,
      isFeatured: false,
      thumbnail: UImages.miTrimmer,
      description:
          'Groom yourself to perfection with the Mi Beard Trimmer. It features self-sharpening stainless steel blades and 40 length settings for precise styling. With 90 minutes of cordless usage on a single charge and IPX7 waterproof rating, it offers convenience and performance in one sleek package.',
      brand: brands[54],
      categoryId: '15',
      sku: 'MI-BT-075',
      productType: 'ProductType.single',
    ),

    // --- 56. MICROMAX (Brand ID: 56 | Index 55) ---
    ProductModel(
      id: 'p76',
      title: 'Micromax IN Note 2',
      stock: 15,
      price: 12499,
      isFeatured: true,
      thumbnail: UImages.micromaxInNote2,
      description:
          'Discover the stunning Micromax IN Note 2. Featuring a brilliant 6.43-inch AMOLED display and a sleek glass finish, it looks as good as it performs. Powered by the Helio G95 processor and 30W fast charging, it handles gaming and multitasking with ease. Capture amazing shots with its 48MP quad-camera setup.',
      brand: brands[55],
      categoryId: '4',
      sku: 'MM-IN-076',
      productType: 'ProductType.single',
    ),

    // --- 57. MINIMALIST (Brand ID: 57 | Index 56) ---
    ProductModel(
      id: 'p77',
      title: 'Minimalist Vitamin C Serum',
      stock: 50,
      price: 699,
      isFeatured: true,
      thumbnail: UImages.minimalistVitaminCSerum,
      description:
          'Get glowing skin with Minimalist 10% Vitamin C Serum. This potent antioxidant serum brightens complexion, reduces dark spots, and protects against sun damage. Formulated with stable Vitamin C derivative and Acetyl Glucosamine, it is lightweight, non-sticky, and suitable for all skin types.',
      brand: brands[56],
      categoryId: '10',
      sku: 'MIN-VC-077',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p78',
      title: 'Minimalist Niacinamide',
      stock: 40,
      price: 599,
      isFeatured: false,
      thumbnail: UImages.minimalistNiacinamide,
      description:
          'Banish blemishes with Minimalist 10% Niacinamide Serum. It effectively reduces acne marks, controls sebum production, and minimizes open pores. Enriched with Zinc, this serum soothes inflammation and strengthens the skin barrier, giving you clear, healthy-looking skin.',
      brand: brands[56],
      categoryId: '10',
      sku: 'MIN-NS-078',
      productType: 'ProductType.single',
    ),

    // --- 58. MONTE CARLO (Brand ID: 58 | Index 57) ---
    ProductModel(
      id: 'p79',
      title: 'Monte Carlo Sweater',
      stock: 20,
      price: 2200,
      isFeatured: true,
      thumbnail: UImages.monteCarloSweater,
      description:
          'Stay warm and classy with this Monte Carlo Men\'s Sweater. Knitted from a premium wool blend, it offers superior warmth and softness. The classic V-neck design and ribbed cuffs make it a versatile piece that can be layered over shirts for a smart-casual winter look.',
      brand: brands[57],
      categoryId: '21',
      sku: 'MC-SW-079',
      productType: 'ProductType.single',
    ),

    // --- 59. MOTHERCARE (Brand ID: 59 | Index 58) ---
    ProductModel(
      id: 'p80',
      title: 'Mothercare Baby Blanket',
      stock: 45,
      price: 899,
      isFeatured: true,
      thumbnail: UImages.mothercareBabyBlanket,
      description:
          'Wrap your newborn in the softness of the Mothercare Baby Blanket. Made from ultra-soft fleece fabric, it provides gentle warmth without overheating. Lightweight and durable, this blanket is perfect for swaddling, stroller rides, or as a cozy layer in the crib.',
      brand: brands[58],
      categoryId: '31',
      sku: 'MC-BB-080',
      productType: 'ProductType.single',
    ),

    // --- 60. MUFTI (Brand ID: 60 | Index 59) ---
    ProductModel(
      id: 'p81',
      title: 'Mufti Slim Fit Jeans',
      stock: 30,
      price: 2199,
      isFeatured: true,
      thumbnail: UImages.muftiSlimFitJeans,
      description:
          'Redefine casual cool with Mufti Slim Fit Jeans. These jeans feature a contemporary slim cut and a comfortable mid-rise waist. Crafted from stretchable denim with a subtle wash, they offer effortless style and all-day comfort. Pair them with a graphic tee or a casual shirt.',
      brand: brands[59],
      categoryId: '20',
      sku: 'MUF-SJ-081',
      productType: 'ProductType.single',
    ),

    // --- 61. MYGLAMM (Brand ID: 61 | Index 60) ---
    ProductModel(
      id: 'p82',
      title: 'MyGlamm Liquid Lipstick',
      stock: 100,
      price: 395,
      isFeatured: true,
      thumbnail: UImages.myglammLiquidLipstick,
      images: [
        UImages.myglammLiquidLipstickPink,
        UImages.myglammLiquidLipstickRed,
      ],
      description:
          'Pucker up with MyGlamm LIT Liquid Matte Lipstick. This Moringa oil-infused formula delivers intense, transfer-proof color that lasts up to 12 hours. It glides on smoothly and dries to a comfortable matte finish that doesn\'t crack or dry out your lips. Available in stunning shades.',
      brand: brands[60],
      categoryId: '11',
      sku: 'MG-LL-082',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Shade', values: ['Pink', 'Red']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v11',
          price: 395,
          stock: 20,
          image: UImages.myglammLiquidLipstickPink,
          attributeValues: {'Shade': 'Pink'},
          description: 'Soft pink shade for a playful look.',
        ),
        ProductVariationModel(
          id: 'v12',
          price: 395,
          stock: 25,
          image: UImages.myglammLiquidLipstickRed,
          attributeValues: {'Shade': 'Red'},
          description: 'Bold red shade for a dramatic effect.',
        ),
      ],
    ),

    // --- 62. NOISE (Brand ID: 62 | Index 61) ---
    ProductModel(
      id: 'p83',
      title: 'Noise ColorFit Watch',
      stock: 40,
      price: 1799,
      isFeatured: true,
      thumbnail: UImages.noiseColorfitWatch,
      description:
          'Stay connected and fit with the Noise ColorFit Pulse Smartwatch. It features a 1.4-inch full-touch display, 24/7 heart rate monitoring, and sleep tracking. With customizable watch faces and 10-day battery life, it is the perfect blend of style and technology for your wrist.',
      brand: brands[61],
      categoryId: '4',
      sku: 'NOI-CW-083',
      productType: 'ProductType.single',
    ),

    // --- 63. NYKAA (Brand ID: 63 | Index 62) ---
    ProductModel(
      id: 'p84',
      title: 'Nykaa Black Eyeliner',
      stock: 120,
      price: 299,
      isFeatured: true,
      thumbnail: UImages.nykaaBlackEyeliner,
      description:
          'Create dramatic eyes with Nykaa Black Magic Liquid Eyeliner. Its fluid, water-resistant formula glides on effortlessly to create precise lines. Whether you want a thin line or a bold cat-eye, the fine tip applicator gives you total control. Dries quickly to a deep black matte finish.',
      brand: brands[62],
      categoryId: '11',
      sku: 'NYK-BE-084',
      productType: 'ProductType.single',
    ),

    // --- 64. PANTALOONS JUNIOR (Brand ID: 64 | Index 63) ---
    ProductModel(
      id: 'p85',
      title: 'Pantaloons Junior Shorts',
      stock: 50,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.pantaloonsJuniorShorts,
      description:
          'Get your boy ready for summer adventures with Pantaloons Junior Shorts. Made from soft, durable cotton twill, these shorts are comfortable for play and outings. They feature practical pockets and an adjustable waist for a secure fit. Easy to pair with any t-shirt.',
      brand: brands[63],
      categoryId: '29',
      sku: 'PJ-JS-085',
      productType: 'ProductType.single',
    ),

    // --- 65. PARK AVENUE (Brand ID: 65 | Index 64) ---
    ProductModel(
      id: 'p86',
      title: 'Park Avenue Beer Shampoo',
      stock: 70,
      price: 180,
      isFeatured: true,
      thumbnail: UImages.parkAvenueBeerShampoo,
      description:
          'Give your hair a bounce with Park Avenue Beer Shampoo. Formulated with real beer, which is rich in barley and hops, it conditions and nourishes your hair from root to tip. It cleanses excess oil, adds natural shine, and leaves your hair looking voluminous and healthy.',
      brand: brands[64],
      categoryId: '12',
      sku: 'PA-BS-086',
      productType: 'ProductType.single',
    ),

    // --- 66. PEARS (Brand ID: 66 | Index 65) ---
    ProductModel(
      id: 'p87',
      title: 'Pears Transparent Soap',
      stock: 300,
      price: 55,
      isFeatured: true,
      thumbnail: UImages.pearsTransparentSoap,
      description:
          'Trust the gentle care of Pears Pure & Gentle Soap. With 98% pure glycerin and natural oils, this iconic transparent soap cleanses your skin without stripping its natural oils. It is dermatologically tested to be mild on delicate skin, leaving it soft, smiling, and innocent.',
      brand: brands[65],
      categoryId: '16',
      sku: 'PRS-TS-087',
      productType: 'ProductType.single',
    ),

    // --- 67. PETER ENGLAND (Brand ID: 67 | Index 66) ---
    ProductModel(
      id: 'p88',
      title: 'Peter England Formal Shirt',
      stock: 40,
      price: 1399,
      isFeatured: true,
      thumbnail: UImages.peterEnglandFormalShirt,
      description:
          'Look sharp and professional in this Peter England Formal Shirt. Tailored from a wrinkle-resistant cotton blend, it ensures you look crisp throughout the day. The regular fit offers comfort, while the classic collar and solid color make it a versatile addition to your workwear collection.',
      brand: brands[66],
      categoryId: '17',
      sku: 'PE-FS-088',
      productType: 'ProductType.single',
    ),

    // --- 68. PLUM (Brand ID: 68 | Index 67) ---
    ProductModel(
      id: 'p89',
      title: 'Plum Green Tea Face Mask',
      stock: 80,
      price: 490,
      isFeatured: true,
      thumbnail: UImages.plumGreenTeaFaceMask,
      description:
          'Detox your skin with the Plum Green Tea Clear Face Mask. This clay-based mask is enriched with antioxidant green tea and glycolic acid to gently exfoliate and combat acne. It absorbs excess oil and brightens the complexion, leaving your skin feeling fresh, matte, and clear.',
      brand: brands[67],
      categoryId: '10',
      sku: 'PLM-FM-089',
      productType: 'ProductType.single',
    ),

    // --- 69. PORTRONICS (Brand ID: 69 | Index 68) ---
    ProductModel(
      id: 'p90',
      title: 'Portronics SoundDrum',
      stock: 45,
      price: 1499,
      isFeatured: true,
      thumbnail: UImages.portronicsSounddrum,
      description:
          'Experience powerful sound with the Portronics SoundDrum 1. This portable Bluetooth speaker delivers 10W of clear audio with punchy bass. Its splash-resistant design and long-lasting battery make it perfect for outdoor parties. It also features FM radio and a built-in microphone for hands-free calls.',
      brand: brands[68],
      categoryId: '4',
      sku: 'POR-SD-090',
      productType: 'ProductType.single',
    ),

    // --- 70. PTRON (Brand ID: 70 | Index 69) ---
    ProductModel(
      id: 'p91',
      title: 'pTron Bassbuds',
      stock: 60,
      price: 799,
      isFeatured: true,
      thumbnail: UImages.ptronBassbuds,
      description:
          'Cut the cord with pTron Bassbuds True Wireless Earbuds. Offering deep bass and stereo sound, they provide an immersive audio experience. The lightweight design ensures a secure fit, while the charging case extends playback time. Multi-function buttons allow easy control over music and calls.',
      brand: brands[69],
      categoryId: '4',
      sku: 'PT-BB-091',
      productType: 'ProductType.single',
    ),

    // --- 71. PUMA (Brand ID: 71 | Index 70) ---
    ProductModel(
      id: 'p92',
      title: 'Puma Running Shoes',
      stock: 25,
      price: 3999,
      salePrice: 2499,
      isFeatured: true,
      thumbnail: UImages.pumaRunningShoes,
      description:
          'Run faster and further with Puma Men\'s Running Shoes. Featuring a breathable mesh upper and SoftFoam+ sockliner, they provide instant step-in comfort and long-lasting cushioning. The durable rubber outsole ensures grip and traction on various surfaces, making them ideal for your daily runs.',
      brand: brands[70],
      categoryId: '22',
      sku: 'PUM-RS-092',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v13',
          price: 2499,
          stock: 10,
          image: UImages.pumaRunningShoesBlack,
          attributeValues: {'Color': 'Black'},
          description: 'Stealth black for a sleek athletic look.',
        ),
        ProductVariationModel(
          id: 'v14',
          price: 2499,
          stock: 8,
          image: UImages.pumaRunningShoesBlue,
          attributeValues: {'Color': 'Blue'},
          description: 'Electric blue to stand out on the track.',
        ),
      ],
    ),
    ProductModel(
      id: 'p93',
      title: 'Puma Sports Socks',
      stock: 200,
      price: 299,
      isFeatured: false,
      thumbnail: UImages.pumaSportsSocks,
      description:
          'Step into comfort with this pack of Puma Sports Socks. Made from a soft cotton blend with added stretch, they offer a snug fit that stays in place. Ideally cushioned at the heel and toe, they provide support and prevent blisters during sports activities.',
      brand: brands[70],
      categoryId: '22',
      sku: 'PUM-SS-093',
      productType: 'ProductType.single',
    ),

    // --- 72. RANGRITI (Brand ID: 72 | Index 71) ---
    ProductModel(
      id: 'p94',
      title: 'Rangriti Ethnic Skirt',
      stock: 25,
      price: 1599,
      isFeatured: true,
      thumbnail: UImages.rangritiEthnicSkirt,
      description:
          'Twirl in style with this vibrant Rangriti Ethnic Skirt. Featuring a flared silhouette and traditional prints, it adds a boho-chic vibe to your look. The elasticated waistband with a drawstring ensures a comfortable fit. Pair it with a solid top and ethnic jewelry.',
      brand: brands[71],
      categoryId: '25',
      sku: 'RAN-ES-094',
      productType: 'ProductType.single',
    ),

    // --- 73. RAYMOND (Brand ID: 73 | Index 72) ---
    ProductModel(
      id: 'p95',
      title: 'Raymond Formal Suit',
      stock: 10,
      price: 7999,
      isFeatured: true,
      thumbnail: UImages.raymondFormalSuit,
      description:
          'Exude sophistication with this Raymond Formal Suit. Expertly tailored from a premium poly-viscose blend, this 2-piece suit features a structured blazer and matching trousers. The impeccable fit and classic design make it the perfect choice for business meetings, weddings, and formal events.',
      brand: brands[72],
      categoryId: '6',
      sku: 'RAY-FS-095',
      productType: 'ProductType.single',
    ),

    // --- 74. RED TAPE (Brand ID: 74 | Index 73) ---
    ProductModel(
      id: 'p96',
      title: 'Red Tape Sneakers',
      stock: 30,
      price: 4999,
      salePrice: 1499,
      isFeatured: true,
      thumbnail: UImages.redTapeSneakers,
      description:
          'Upgrade your street style with Red Tape Men\'s Sneakers. These trendy white sneakers feature a durable synthetic upper and a cushioned footbed for all-day comfort. The sturdy rubber sole provides excellent grip, making them a stylish and practical choice for casual wear.',
      brand: brands[73],
      categoryId: '22',
      sku: 'RT-SN-096',
      productType: 'ProductType.single',
    ),

    // --- 75. ROADSTER (Brand ID: 75 | Index 74) ---
    ProductModel(
      id: 'p97',
      title: 'Roadster Graphic Tee',
      stock: 80,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.roadsterGraphicTee,
      description:
          'Express yourself with this cool Roadster Graphic T-Shirt. Made from 100% soft cotton jersey, it offers breathable comfort for everyday wear. The bold chest print adds a modern urban edge, making it perfect to pair with jeans and sneakers for a laid-back vibe.',
      brand: brands[74],
      categoryId: '18',
      sku: 'ROD-GT-097',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p98',
      title: 'Roadster Jeans',
      stock: 40,
      price: 1299,
      isFeatured: true,
      thumbnail: UImages.roadsterJeans,
      description:
          'Find your perfect fit with Roadster Men\'s Jeans. These slim tapered fit jeans are crafted from stretchable denim for maximum comfort and flexibility. The lightly washed finish gives them a worn-in look that pairs effortlessly with t-shirts or casual shirts.',
      brand: brands[74],
      categoryId: '20',
      sku: 'ROD-JN-098',
      productType: 'ProductType.single',
    ),

    // --- 76. SAFARI (Brand ID: 76 | Index 75) ---
    ProductModel(
      id: 'p99',
      title: 'Safari Trolley Bag',
      stock: 25,
      price: 4500,
      salePrice: 2100,
      isFeatured: true,
      thumbnail: UImages.safariTrolleyBag,
      description:
          'Travel tough with the Safari Pentagon Trolley Bag. This hard-sided check-in luggage is made from virtually unbreakable polypropylene. It features a scratch-resistant texture, smooth 4-wheel spinner system, and a fixed combination lock to keep your belongings secure during transit.',
      brand: brands[75],
      categoryId: '2',
      sku: 'SAF-TB-099',
      productType: 'ProductType.single',
    ),

    // --- 77. SANTOOR (Brand ID: 77 | Index 76) ---
    ProductModel(
      id: 'p100',
      title: 'Santoor Sandal Soap',
      stock: 500,
      price: 45,
      isFeatured: true,
      thumbnail: UImages.santoorSandalSoap,
      description:
          'Reveal youthful, glowing skin with Santoor Sandal and Turmeric Soap. A favorite for generations, this soap combines the benefits of Sandalwood to cool and smoothen skin, and Turmeric to control acne and lighten marks. It provides a refreshing bath experience with a traditional fragrance.',
      brand: brands[76],
      categoryId: '16',
      sku: 'SAN-SS-100',
      productType: 'ProductType.single',
    ),

    // --- 78. SKINN (Brand ID: 78 | Index 77) ---
    ProductModel(
      id: 'p101',
      title: 'Skinn Titan Perfume',
      stock: 35,
      price: 1395,
      isFeatured: true,
      thumbnail: UImages.skinnTitanPerfume,
      description:
          'Experience the raw power of nature with Skinn by Titan Raw Perfume for Men. Crafted by French perfumers, this woody aquatic fragrance exudes freshness and masculinity. With notes of bergamot, watermelon, and patchouli, it is crisp, distinct, and perfect for the confident man.',
      brand: brands[77],
      categoryId: '13',
      sku: 'SKN-TP-101',
      productType: 'ProductType.single',
    ),

    // --- 79. SKYBAGS (Brand ID: 79 | Index 78) ---
    ProductModel(
      id: 'p102',
      title: 'Skybags College Backpack',
      stock: 40,
      price: 1199,
      isFeatured: true,
      thumbnail: UImages.skybagsCollegeBackpack,
      description:
          'Make a style statement on campus with the Skybags College Backpack. Featuring vibrant graphics and a sleek design, it offers three spacious compartments to hold books and gear. The padded shoulder straps and back panel ensure comfort, while the durable fabric withstands daily rough use.',
      brand: brands[78],
      categoryId: '2',
      sku: 'SKY-CB-102',
      productType: 'ProductType.single',
    ),

    // --- 80. SOCH (Brand ID: 80 | Index 79) ---
    ProductModel(
      id: 'p103',
      title: 'Soch Saree',
      stock: 15,
      price: 3499,
      isFeatured: true,
      thumbnail: UImages.sochSaree,
      description:
          'Drape yourself in grace with this Soch Designer Saree. Made from luxurious silk blend fabric, it features exquisite embroidery and a rich border. Ideally suited for weddings and festive celebrations, this saree comes with an unstitched blouse piece to customize your look.',
      brand: brands[79],
      categoryId: '26',
      sku: 'SOC-SR-103',
      productType: 'ProductType.single',
    ),

    // --- 81. STREAX (Brand ID: 81 | Index 80) ---
    ProductModel(
      id: 'p104',
      title: 'Streax Hair Serum',
      stock: 100,
      price: 210,
      isFeatured: true,
      thumbnail: UImages.streaxHairSerum,
      description:
          'Get salon-smooth hair instantly with Streax Walnut Hair Serum. Enriched with walnut oil and Vitamin E, it tames frizz, adds a glossy shine, and protects hair from heat damage. Just a few drops are enough to detangle and silken your hair, making it manageable and soft.',
      brand: brands[80],
      categoryId: '12',
      sku: 'STR-HS-104',
      productType: 'ProductType.single',
    ),

    // --- 82. SUGAR COSMETICS (Brand ID: 82 | Index 81) ---
    ProductModel(
      id: 'p105',
      title: 'Sugar Kohl Pencil',
      stock: 70,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.sugarKohlPencil,
      description:
          'Define your eyes with the intense Sugar Stroke of Genius Heavy-Duty Kohl. Its wax-based formula glides on smoothly, delivering a rich black pigment in a single swipe. Waterproof and smudge-proof for up to 8 hours, it comes with a built-in sharpener for precise application every time.',
      brand: brands[81],
      categoryId: '11',
      sku: 'SUG-KP-105',
      productType: 'ProductType.single',
    ),

    // --- 83. SWISS BEAUTY (Brand ID: 83 | Index 82) ---
    ProductModel(
      id: 'p106',
      title: 'Swiss Beauty Concealer',
      stock: 65,
      price: 229,
      isFeatured: true,
      thumbnail: UImages.swissBeautyConcealer,
      description:
          'Hide imperfections effortlessly with Swiss Beauty Liquid Concealer. This high-coverage formula effectively covers dark circles, redness, and blemishes. Lightweight and creamy, it blends easily into the skin without creasing, providing a natural, flawless finish that brightens your look.',
      brand: brands[82],
      categoryId: '11',
      sku: 'SB-CN-106',
      productType: 'ProductType.single',
    ),

    // --- 84. SYSKA (Brand ID: 84 | Index 83) ---
    ProductModel(
      id: 'p107',
      title: 'Syska Hair Dryer',
      stock: 50,
      price: 899,
      isFeatured: true,
      thumbnail: UImages.syskaHairDryer,
      description:
          'Style your hair everyday with the Syska Trendsetter Hair Dryer. Compact and foldable, it is perfect for travel and storage. It features two heat settings for gentle drying and styling, and heat balance technology to prevent hair damage. Get salon-like drying at home.',
      brand: brands[83],
      categoryId: '4',
      sku: 'SYS-HD-107',
      productType: 'ProductType.single',
    ),

    // --- 85. THE MAN COMPANY (Brand ID: 85 | Index 84) ---
    ProductModel(
      id: 'p108',
      title: 'The Man Company Charcoal Wash',
      stock: 50,
      price: 349,
      isFeatured: true,
      thumbnail: UImages.theManCompanyCharcoalWash,
      description:
          'Refresh dull and tired skin with The Man Company Charcoal Face Wash. Powered by Ylang Ylang and Argan, it deep cleanses pores to remove dirt and pollution while keeping the skin hydrated. Its anti-bacterial properties help prevent acne, leaving your face feeling clean and energized.',
      brand: brands[84],
      categoryId: '15',
      sku: 'TMC-CW-108',
      productType: 'ProductType.single',
    ),

    // --- 86. TRESEMME (Brand ID: 86 | Index 85) ---
    ProductModel(
      id: 'p109',
      title: 'TRESemmé Keratin Shampoo',
      stock: 90,
      price: 450,
      isFeatured: true,
      thumbnail: UImages.tresemmeKeratinShampoo,
      description:
          'Control frizz for up to 3 days with TRESemmé Keratin Smooth Shampoo. Infused with Keratin and Argan Oil, this lower sulfate formula nourishes each strand to leave hair straighter, smoother, and shinier. It gently cleanses while restoring lost protein, making it ideal for dry and frizzy hair.',
      brand: brands[85],
      categoryId: '12',
      sku: 'TRE-KS-109',
      productType: 'ProductType.single',
    ),

    // --- 87. URBAN GABRU (Brand ID: 87 | Index 86) ---
    ProductModel(
      id: 'p110',
      title: 'UrbanGabru Hair Wax',
      stock: 80,
      price: 300,
      isFeatured: true,
      thumbnail: UImages.urbangabruHairWax,
      description:
          'Get the perfect hairstyle that holds all day with UrbanGabru Clay Hair Wax. Made with natural ingredients like Vitamin E and Earth Clay, it adds volume and texture without damaging your hair. Easy to wash off, it provides a strong hold and a matte finish for a natural look.',
      brand: brands[86],
      categoryId: '15',
      sku: 'UG-HW-110',
      productType: 'ProductType.single',
    ),

    // --- 88. U.S. POLO ASSN. (Brand ID: 88 | Index 87) ---
    ProductModel(
      id: 'p111',
      title: 'US Polo T-Shirt',
      stock: 45,
      price: 1899,
      isFeatured: true,
      thumbnail: UImages.usPoloTshirt,
      images: [UImages.usPoloTshirtNavy, UImages.usPoloTshirtWhite],
      description:
          'Embody classic American style with this US Polo Assn. Men\'s Polo T-Shirt. Crafted from premium pique cotton, it offers superior comfort and breathability. Featuring the iconic embroidered logo and a ribbed collar, it is a timeless essential for a smart-casual wardrobe.',
      brand: brands[87],
      categoryId: '18',
      sku: 'USP-TS-111',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Navy', 'White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v15',
          price: 1899,
          stock: 15,
          image: UImages.usPoloTshirtNavy,
          attributeValues: {'Color': 'Navy'},
          description: 'Deep navy blue for a sophisticated casual look.',
        ),
        ProductVariationModel(
          id: 'v16',
          price: 1899,
          stock: 20,
          image: UImages.usPoloTshirtWhite,
          attributeValues: {'Color': 'White'},
          description: 'Crisp white polo that pairs with everything.',
        ),
      ],
    ),
    ProductModel(
      id: 'p112',
      title: 'US Polo Jeans',
      stock: 30,
      price: 2499,
      isFeatured: false,
      thumbnail: UImages.usPoloJeans,
      description:
          'Experience rugged comfort with US Polo Assn. Men\'s Jeans. These regular fit jeans are made from durable cotton denim that stands the test of time. With a classic 5-pocket styling and a medium wash, they offer a relaxed look perfect for weekends and casual Fridays.',
      brand: brands[87],
      categoryId: '20',
      sku: 'USP-JN-112',
      productType: 'ProductType.single',
    ),

    // --- 89. USTRAA (Brand ID: 89 | Index 88) ---
    ProductModel(
      id: 'p113',
      title: 'Ustraa Cologne',
      stock: 60,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.ustraaCologne,
      description:
          'Make your presence felt with Ustraa Ammunition Cologne. This intense fragrance for men is loaded with deep, mysterious notes of charcoal, tobacco, and oakmoss. Designed for the night, it offers a long-lasting scent that is bold, masculine, and impossible to ignore.',
      brand: brands[88],
      categoryId: '13',
      sku: 'UST-CL-113',
      productType: 'ProductType.single',
    ),

    // --- 90. VAN HEUSEN (Brand ID: 90 | Index 89) ---
    ProductModel(
      id: 'p114',
      title: 'Van Heusen Formal Shirt',
      stock: 120,
      price: 1499,
      isFeatured: true,
      thumbnail: UImages.vanHeusenFormalShirt,
      description:
          'Sharpen your workwear with this Van Heusen Formal Shirt. Tailored for a regular fit, it is made from a breathable cotton blend that keeps you comfortable all day. The solid color and stiff collar provide a clean, professional look suitable for meetings and daily office wear.',
      brand: brands[89],
      categoryId: '17',
      sku: 'VH-FS-114',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'v17',
          price: 1499,
          stock: 25,
          image: UImages.vanHeusenFormalShirtWhite,
          attributeValues: {'Color': 'White'},
          description: 'Essential white shirt for every business wardrobe.',
        ),
        ProductVariationModel(
          id: 'v18',
          price: 1499,
          stock: 30,
          image: UImages.vanHeusenFormalShirtBlue,
          attributeValues: {'Color': 'Blue'},
          description:
              'Classic blue shirt for a smart professional appearance.',
        ),
      ],
    ),
    ProductModel(
      id: 'p115',
      title: 'Van Heusen Innerwear',
      stock: 150,
      price: 399,
      isFeatured: true,
      thumbnail: UImages.vanHeusenInnerwear,
      description:
          'Experience all-day comfort with Van Heusen Men\'s Cotton Briefs. Made from premium combed cotton with antibacterial technology, they keep you fresh and odor-free. The soft elastic waistband ensures a snug, mark-free fit, making them an essential daily basic.',
      brand: brands[89],
      categoryId: '6',
      sku: 'VH-IN-115',
      productType: 'ProductType.single',
    ),

    // --- 91. VIP (Brand ID: 91 | Index 90) ---
    ProductModel(
      id: 'p116',
      title: 'VIP Duffle Trolley',
      stock: 20,
      price: 2800,
      isFeatured: true,
      thumbnail: UImages.vipDuffleTrolley,
      description:
          'Travel convenient with the VIP Duffle Trolley Bag. Combining the flexibility of a duffle with the ease of a trolley, it is perfect for short trips. Features include durable nylon fabric, smooth wheels, and a sturdy retractable handle. Spacious and lightweight for hassle-free travel.',
      brand: brands[90],
      categoryId: '2',
      sku: 'VIP-DT-116',
      productType: 'ProductType.single',
    ),

    // --- 92. WILDCRAFT (Brand ID: 92 | Index 91) ---
    ProductModel(
      id: 'p117',
      title: 'Wildcraft Rucksack',
      stock: 15,
      price: 3500,
      isFeatured: true,
      thumbnail: UImages.wildcraftRucksack,
      description:
          'Gear up for adventure with the Wildcraft 45L Rucksack. Designed for trekking and hiking, it features an ergonomic back system for load management and breathability. Made from abrasion-resistant fabric, it includes multiple pockets and loops for carrying gear on rugged terrains.',
      brand: brands[91],
      categoryId: '2',
      sku: 'WC-RS-117',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p118',
      title: 'Wildcraft Jacket',
      stock: 25,
      price: 2499,
      isFeatured: true,
      thumbnail: UImages.wildcraftJacket,
      description:
          'Brave the elements with this Wildcraft Men\'s Windcheater Jacket. Lightweight and water-repellent, it protects you from light rain and wind. Featuring a full zip closure and high neck, it is perfect for outdoor activities like biking, running, or hiking in unpredictable weather.',
      brand: brands[91],
      categoryId: '21',
      sku: 'WC-JK-118',
      productType: 'ProductType.single',
    ),

    // --- 93. WILD STONE (Brand ID: 93 | Index 92) ---
    ProductModel(
      id: 'p119',
      title: 'Wild Stone Deodorant',
      stock: 100,
      price: 199,
      isFeatured: true,
      thumbnail: UImages.wildStoneDeodorant,
      description:
          'Unleash your wild side with Wild Stone Ultra Sensual Deodorant. This strong fragrance combines zesty lemon with aromatic lavender and woody amber notes. Designed for the man who wants to stand out, it offers long-lasting freshness and odor protection for active days.',
      brand: brands[92],
      categoryId: '13',
      sku: 'WS-DEO-119',
      productType: 'ProductType.single',
    ),

    // --- 94. WOODLAND (Brand ID: 94 | Index 93) ---
    ProductModel(
      id: 'p120',
      title: 'Woodland Leather Boots',
      stock: 25,
      price: 4295,
      isFeatured: true,
      thumbnail: UImages.woodlandLeatherBoots,
      description:
          'Explore the outdoors in iconic Woodland Leather Boots. Known for their rugged durability, these boots feature a nubuck leather upper and a deep lugged rubber sole for superior traction on uneven terrain. The padded collar ensures ankle support, making them perfect for hiking and adventure.',
      brand: brands[93],
      categoryId: '22',
      sku: 'WDL-LB-120',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p121',
      title: 'Woodland Wallet',
      stock: 40,
      price: 1299,
      isFeatured: false,
      thumbnail: UImages.woodlandWallet,
      description:
          'Keep your cash and cards secure with this Woodland Men\'s Leather Wallet. Crafted from durable, vegetable-tanned leather, it ages beautifully over time. It features a classic bi-fold design with plenty of card slots and a coin pocket, offering both style and utility.',
      brand: brands[93],
      categoryId: '6',
      sku: 'WDL-WL-121',
      productType: 'ProductType.single',
    ),

    // --- 95. WOW SKIN SCIENCE (Brand ID: 95 | Index 94) ---
    ProductModel(
      id: 'p122',
      title: 'WOW Apple Cider Shampoo',
      stock: 100,
      price: 499,
      isFeatured: true,
      thumbnail: UImages.wowAppleCiderShampoo,
      description:
          'Restore shine and smoothness to your hair with WOW Skin Science Apple Cider Vinegar Shampoo. This clarifying shampoo helps remove scalp buildup, restore pH balance, and unclog hair follicles. Free from sulphates and parabens, it is gentle enough for daily use on all hair types.',
      brand: brands[94],
      categoryId: '12',
      sku: 'WOW-SH-122',
      productType: 'ProductType.single',
    ),

    // --- 96. ZEBRONICS (Brand ID: 96 | Index 95) ---
    ProductModel(
      id: 'p123',
      title: 'Zebronics Soundbar',
      stock: 30,
      price: 4999,
      isFeatured: true,
      thumbnail: UImages.zebronicsSoundbar,
      description:
          'Upgrade your TV audio with the Zebronics Juke Bar Soundbar. With 60W output and a built-in subwoofer, it delivers cinematic sound with deep bass. It supports multi-connectivity options like Bluetooth, USB, and AUX, making it a versatile addition to your home entertainment setup.',
      brand: brands[95],
      categoryId: '4',
      sku: 'ZEB-SB-123',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p124',
      title: 'Zebronics Mouse',
      stock: 200,
      price: 249,
      isFeatured: false,
      thumbnail: UImages.zebronicsMouse,
      description:
          'Enhance your productivity with the Zebronics USB Optical Mouse. Designed for comfort, its ergonomic shape fits perfectly in your hand for long hours of use. The high-precision optical sensor ensures smooth tracking on most surfaces. Just plug and play for hassle-free computing.',
      brand: brands[95],
      categoryId: '4',
      sku: 'ZEB-MS-124',
      productType: 'ProductType.single',
    ),

    // --- 97. ZIVAME (Brand ID: 97 | Index 96) ---
    ProductModel(
      id: 'p125',
      title: 'Zivame T-Shirt Bra',
      stock: 60,
      price: 799,
      isFeatured: true,
      thumbnail: UImages.zivameTshirtBra,
      description:
          'Enjoy seamless comfort with the Zivame Padded Wire-Free T-Shirt Bra. Designed to remain invisible under fitted clothes, it offers medium coverage and gentle support. The soft, breathable fabric and adjustable straps make it an ideal choice for everyday wear.',
      brand: brands[96],
      categoryId: '28',
      sku: 'ZIV-TB-125',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p126',
      title: 'Zivame Nightwear',
      stock: 40,
      price: 999,
      isFeatured: false,
      thumbnail: UImages.zivameNightwear,
      description:
          'Sleep in comfort with this cute Zivame Cotton Nightwear Set. Featuring a printed tee and matching pyjamas, it is made from soft, breathable cotton fabric. The relaxed fit ensures you get a good night\'s rest or enjoy a lazy lounging day at home.',
      brand: brands[96],
      categoryId: '27',
      sku: 'ZIV-NW-126',
      productType: 'ProductType.single',
    ),

    // --- 98. ZUDIO (Brand ID: 98 | Index 97) ---
    ProductModel(
      id: 'p127',
      title: 'Zudio Flip Flops',
      stock: 150,
      price: 199,
      isFeatured: true,
      thumbnail: UImages.zudioFlipFlops,
      images: [UImages.zudioFlipFlops],
      description:
          'Step into casual comfort with Zudio Men\'s Flip Flops. These lightweight slippers feature a durable rubber sole and comfortable straps. Perfect for beach days or lounging at home, they come in a variety of fun colors to match your laid-back style.',
      brand: brands[97],
      categoryId: '22',
      sku: 'ZUD-FF-127',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: 'p128',
      title: 'Zudio Casual Tee',
      stock: 100,
      price: 299,
      isFeatured: false,
      thumbnail: UImages.zudioCasualTee,
      description:
          'Keep it simple and stylish with the Zudio Men\'s Casual T-Shirt. Made from soft cotton fabric, this round neck tee offers a regular fit for everyday ease. Available in solid colors and cool prints, it is a wardrobe essential for casual outings.',
      brand: brands[97],
      categoryId: '18',
      sku: 'ZUD-CT-128',
      productType: 'ProductType.single',
    ),
  ];

  // --- 1. BRAND CATEGORY RELATIONSHIPS ---
  // Connects every brand to its relevant category/categories.
  static final List<BrandCategoryModel> brandCategory = [
    // =============================================================
    // 1. PARENT CATEGORY LINKS (MANDATORY FOR TABS TO WORK)
    // =============================================================

    /// --- TRAVEL TAB (Category ID: 1) ---
    BrandCategoryModel(brandId: '5', categoryId: '1'), // American Tourister
    BrandCategoryModel(brandId: '6', categoryId: '1'), // Aristocrat
    BrandCategoryModel(brandId: '76', categoryId: '1'), // Safari
    BrandCategoryModel(brandId: '79', categoryId: '1'), // Skybags
    BrandCategoryModel(brandId: '91', categoryId: '1'), // VIP
    BrandCategoryModel(brandId: '92', categoryId: '1'), // Wildcraft
    // Electronics in Travel
    BrandCategoryModel(brandId: '4', categoryId: '1'), // Ambrane
    BrandCategoryModel(brandId: '14', categoryId: '1'), // Boat
    BrandCategoryModel(brandId: '55', categoryId: '1'), // Mi
    BrandCategoryModel(brandId: '62', categoryId: '1'), // Noise
    BrandCategoryModel(brandId: '69', categoryId: '1'), // Portronics
    BrandCategoryModel(brandId: '84', categoryId: '1'), // Syska
    BrandCategoryModel(brandId: '96', categoryId: '1'), // Zebronics
    /// --- CLOTHING TAB (Category ID: 5) ---
    BrandCategoryModel(brandId: '1', categoryId: '5'), // Adidas
    BrandCategoryModel(brandId: '3', categoryId: '5'), // Allen Solly
    BrandCategoryModel(brandId: '7', categoryId: '5'), // Aurelia
    BrandCategoryModel(brandId: '8', categoryId: '5'), // Babyhug
    BrandCategoryModel(brandId: '11', categoryId: '5'), // Biba
    BrandCategoryModel(brandId: '16', categoryId: '5'), // Campus Sutra
    BrandCategoryModel(brandId: '18', categoryId: '5'), // Decathlon
    BrandCategoryModel(brandId: '29', categoryId: '5'), // Gini & Jony
    BrandCategoryModel(brandId: '32', categoryId: '5'), // Hopkids
    BrandCategoryModel(brandId: '33', categoryId: '5'), // Hopscotch
    BrandCategoryModel(brandId: '34', categoryId: '5'), // HRX
    BrandCategoryModel(brandId: '39', categoryId: '5'), // Killer
    BrandCategoryModel(brandId: '43', categoryId: '5'), // Libas
    BrandCategoryModel(brandId: '45', categoryId: '5'), // Lilliput
    BrandCategoryModel(brandId: '46', categoryId: '5'), // Little Kangaroos
    BrandCategoryModel(brandId: '48', categoryId: '5'), // Louis Philippe
    BrandCategoryModel(brandId: '53', categoryId: '5'), // Maxx
    BrandCategoryModel(brandId: '54', categoryId: '5'), // Melange
    BrandCategoryModel(brandId: '58', categoryId: '5'), // Monte Carlo
    BrandCategoryModel(brandId: '59', categoryId: '5'), // Mothercare
    BrandCategoryModel(brandId: '60', categoryId: '5'), // Mufti
    BrandCategoryModel(brandId: '64', categoryId: '5'), // Pantaloons Junior
    BrandCategoryModel(brandId: '67', categoryId: '5'), // Peter England
    BrandCategoryModel(brandId: '71', categoryId: '5'), // Puma
    BrandCategoryModel(brandId: '72', categoryId: '5'), // Rangriti
    BrandCategoryModel(brandId: '73', categoryId: '5'), // Raymond
    BrandCategoryModel(brandId: '74', categoryId: '5'), // Red Tape
    BrandCategoryModel(brandId: '75', categoryId: '5'), // Roadster
    BrandCategoryModel(brandId: '80', categoryId: '5'), // Soch
    BrandCategoryModel(brandId: '88', categoryId: '5'), // US Polo
    BrandCategoryModel(brandId: '90', categoryId: '5'), // Van Heusen
    BrandCategoryModel(brandId: '94', categoryId: '5'), // Woodland
    BrandCategoryModel(brandId: '97', categoryId: '5'), // Zivame
    BrandCategoryModel(brandId: '98', categoryId: '5'), // Zudio
    /// --- BEAUTY TAB (Category ID: 9) ---
    BrandCategoryModel(brandId: '2', categoryId: '9'), // Ajmal
    BrandCategoryModel(brandId: '9', categoryId: '9'), // Beardo
    BrandCategoryModel(brandId: '10', categoryId: '9'), // Bella Vita
    BrandCategoryModel(brandId: '12', categoryId: '9'), // Biotique
    BrandCategoryModel(brandId: '13', categoryId: '9'), // Blue Heaven
    BrandCategoryModel(brandId: '15', categoryId: '9'), // Bombay Shaving
    BrandCategoryModel(brandId: '17', categoryId: '9'), // Colorbar
    BrandCategoryModel(brandId: '19', categoryId: '9'), // Denver
    BrandCategoryModel(brandId: '20', categoryId: '9'), // Elle 18
    BrandCategoryModel(brandId: '21', categoryId: '9'), // Engage
    BrandCategoryModel(brandId: '22', categoryId: '9'), // Faces Canada
    BrandCategoryModel(brandId: '24', categoryId: '9'), // Fiama
    BrandCategoryModel(brandId: '26', categoryId: '9'), // Fogg
    BrandCategoryModel(brandId: '27', categoryId: '9'), // Forest Essentials
    BrandCategoryModel(brandId: '28', categoryId: '9'), // Gillette
    BrandCategoryModel(brandId: '30', categoryId: '9'), // Good Vibes
    BrandCategoryModel(brandId: '31', categoryId: '9'), // Himalaya
    BrandCategoryModel(brandId: '35', categoryId: '9'), // Indulekha
    BrandCategoryModel(brandId: '36', categoryId: '9'), // Insight
    BrandCategoryModel(brandId: '37', categoryId: '9'), // Just Herbs
    BrandCategoryModel(brandId: '38', categoryId: '9'), // Khadi Natural
    BrandCategoryModel(brandId: '40', categoryId: '9'), // Lakme
    BrandCategoryModel(brandId: '44', categoryId: '9'), // Lifebuoy
    BrandCategoryModel(brandId: '47', categoryId: '9'), // Lotus Herbals
    BrandCategoryModel(brandId: '49', categoryId: '9'), // Lux
    BrandCategoryModel(brandId: '50', categoryId: '9'), // Mamaearth
    BrandCategoryModel(brandId: '51', categoryId: '9'), // Man Arden
    BrandCategoryModel(brandId: '52', categoryId: '9'), // Mars
    BrandCategoryModel(brandId: '57', categoryId: '9'), // Minimalist
    BrandCategoryModel(brandId: '61', categoryId: '9'), // MyGlamm
    BrandCategoryModel(brandId: '63', categoryId: '9'), // Nykaa
    BrandCategoryModel(brandId: '65', categoryId: '9'), // Park Avenue
    BrandCategoryModel(brandId: '66', categoryId: '9'), // Pears
    BrandCategoryModel(brandId: '68', categoryId: '9'), // Plum
    BrandCategoryModel(brandId: '77', categoryId: '9'), // Santoor
    BrandCategoryModel(brandId: '78', categoryId: '9'), // Skinn
    BrandCategoryModel(brandId: '81', categoryId: '9'), // Streax
    BrandCategoryModel(brandId: '82', categoryId: '9'), // Sugar
    BrandCategoryModel(brandId: '83', categoryId: '9'), // Swiss Beauty
    BrandCategoryModel(brandId: '85', categoryId: '9'), // The Man Company
    BrandCategoryModel(brandId: '86', categoryId: '9'), // Tresemme
    BrandCategoryModel(brandId: '87', categoryId: '9'), // UrbanGabru
    BrandCategoryModel(brandId: '89', categoryId: '9'), // Ustraa
    BrandCategoryModel(brandId: '93', categoryId: '9'), // Wild Stone
    BrandCategoryModel(brandId: '95', categoryId: '9'), // WOW Skin Science
    // =============================================================
    // 2. SPECIFIC SUB-CATEGORY LINKS (FOR FILTERS & SEARCH)
    // =============================================================

    // -- Shoes (Category 22) --
    BrandCategoryModel(brandId: '1', categoryId: '22'), // Adidas
    BrandCategoryModel(brandId: '34', categoryId: '22'), // HRX
    BrandCategoryModel(brandId: '71', categoryId: '22'), // Puma
    BrandCategoryModel(brandId: '74', categoryId: '22'), // Red Tape
    BrandCategoryModel(brandId: '94', categoryId: '22'), // Woodland
    BrandCategoryModel(brandId: '98', categoryId: '22'), // Zudio
    // -- Clothing Sub-Categories --
    BrandCategoryModel(brandId: '1', categoryId: '19'), // Adidas -> Pants
    BrandCategoryModel(brandId: '3', categoryId: '17'), // Allen Solly -> Shirts
    BrandCategoryModel(brandId: '3', categoryId: '19'), // Allen Solly -> Pants
    BrandCategoryModel(brandId: '7', categoryId: '27'), // Aurelia -> Kurtis
    BrandCategoryModel(brandId: '11', categoryId: '23'), // Biba -> Dresses
    BrandCategoryModel(brandId: '11', categoryId: '27'), // Biba -> Kurtis
    BrandCategoryModel(
      brandId: '16',
      categoryId: '21',
    ), // Campus Sutra -> Jackets
    BrandCategoryModel(
      brandId: '16',
      categoryId: '19',
    ), // Campus Sutra -> Pants
    BrandCategoryModel(
      brandId: '18',
      categoryId: '18',
    ), // Decathlon -> T-Shirts
    BrandCategoryModel(brandId: '39', categoryId: '20'), // Killer -> Jeans
    BrandCategoryModel(brandId: '39', categoryId: '21'), // Killer -> Jackets
    BrandCategoryModel(brandId: '43', categoryId: '27'), // Libas -> Kurtis
    BrandCategoryModel(brandId: '48', categoryId: '6'), // LP -> Mens General
    BrandCategoryModel(brandId: '54', categoryId: '27'), // Melange -> Kurtis
    BrandCategoryModel(
      brandId: '58',
      categoryId: '21',
    ), // Monte Carlo -> Jackets
    BrandCategoryModel(brandId: '60', categoryId: '20'), // Mufti -> Jeans
    BrandCategoryModel(
      brandId: '67',
      categoryId: '17',
    ), // Peter England -> Shirts
    BrandCategoryModel(brandId: '72', categoryId: '25'), // Rangriti -> Bottoms
    BrandCategoryModel(
      brandId: '73',
      categoryId: '6',
    ), // Raymond -> Mens General
    BrandCategoryModel(brandId: '75', categoryId: '18'), // Roadster -> T-Shirts
    BrandCategoryModel(brandId: '75', categoryId: '20'), // Roadster -> Jeans
    BrandCategoryModel(brandId: '80', categoryId: '26'), // Soch -> Sarees
    BrandCategoryModel(brandId: '88', categoryId: '18'), // US Polo -> T-Shirts
    BrandCategoryModel(brandId: '88', categoryId: '20'), // US Polo -> Jeans
    BrandCategoryModel(brandId: '90', categoryId: '17'), // Van Heusen -> Shirts
    BrandCategoryModel(
      brandId: '97',
      categoryId: '24',
    ), // Zivame -> Tops (FIXED from Footwear)
    BrandCategoryModel(brandId: '97', categoryId: '27'), // Zivame -> Nightwear
    BrandCategoryModel(brandId: '98', categoryId: '18'), // Zudio -> T-Shirts
    // -- Kids (Category 8, 29, 30, 31, 32) --
    BrandCategoryModel(brandId: '8', categoryId: '31'), // Babyhug -> Baby Wear
    BrandCategoryModel(
      brandId: '25',
      categoryId: '31',
    ), // Firstcry -> Baby Wear
    BrandCategoryModel(brandId: '29', categoryId: '29'), // Gini & Jony -> Boys
    BrandCategoryModel(brandId: '32', categoryId: '31'), // Hopkids -> Baby Wear
    BrandCategoryModel(brandId: '33', categoryId: '30'), // Hopscotch -> Girls
    BrandCategoryModel(
      brandId: '45',
      categoryId: '31',
    ), // Lilliput -> Baby Wear
    BrandCategoryModel(
      brandId: '46',
      categoryId: '30',
    ), // Little Kangaroos -> Girls
    BrandCategoryModel(brandId: '53', categoryId: '32'), // Maxx -> Kids Shoes
    BrandCategoryModel(
      brandId: '59',
      categoryId: '31',
    ), // Mothercare -> Baby Wear
    BrandCategoryModel(brandId: '64', categoryId: '29'), // Pantaloons -> Boys
    // -- Luggage & Travel (Category 2, 3, 4) --
    BrandCategoryModel(brandId: '4', categoryId: '4'), // Ambrane -> Electronics
    BrandCategoryModel(
      brandId: '5',
      categoryId: '2',
    ), // American Tourister -> Luggage
    BrandCategoryModel(brandId: '6', categoryId: '2'), // Aristocrat -> Luggage
    BrandCategoryModel(brandId: '14', categoryId: '4'), // Boat -> Electronics
    BrandCategoryModel(brandId: '23', categoryId: '2'), // F Gear -> Luggage
    BrandCategoryModel(brandId: '41', categoryId: '4'), // Lava -> Electronics
    BrandCategoryModel(brandId: '42', categoryId: '2'), // Lavie -> Luggage
    BrandCategoryModel(brandId: '55', categoryId: '4'), // Mi -> Electronics
    BrandCategoryModel(
      brandId: '56',
      categoryId: '4',
    ), // Micromax -> Electronics
    BrandCategoryModel(brandId: '62', categoryId: '4'), // Noise -> Electronics
    BrandCategoryModel(
      brandId: '69',
      categoryId: '4',
    ), // Portronics -> Electronics
    BrandCategoryModel(brandId: '70', categoryId: '4'), // pTron -> Electronics
    BrandCategoryModel(brandId: '76', categoryId: '2'), // Safari -> Luggage
    BrandCategoryModel(brandId: '79', categoryId: '2'), // Skybags -> Luggage
    BrandCategoryModel(brandId: '84', categoryId: '4'), // Syska -> Electronics
    BrandCategoryModel(brandId: '91', categoryId: '2'), // VIP -> Luggage
    BrandCategoryModel(brandId: '92', categoryId: '2'), // Wildcraft -> Luggage
    BrandCategoryModel(brandId: '92', categoryId: '21'), // Wildcraft -> Jackets
    BrandCategoryModel(
      brandId: '96',
      categoryId: '4',
    ), // Zebronics -> Electronics
    // -- Beauty & Grooming (Category 10, 11, 12, 13, 14, 15, 16) --
    BrandCategoryModel(brandId: '2', categoryId: '13'), // Ajmal -> Fragrance
    BrandCategoryModel(brandId: '9', categoryId: '15'), // Beardo -> Grooming
    BrandCategoryModel(
      brandId: '10',
      categoryId: '13',
    ), // Bella Vita -> Fragrance
    BrandCategoryModel(brandId: '12', categoryId: '10'), // Biotique -> Skin
    BrandCategoryModel(brandId: '12', categoryId: '12'), // Biotique -> Hair
    BrandCategoryModel(
      brandId: '13',
      categoryId: '11',
    ), // Blue Heaven -> Makeup
    BrandCategoryModel(
      brandId: '15',
      categoryId: '16',
    ), // Bombay Shaving -> Soap
    BrandCategoryModel(brandId: '17', categoryId: '11'), // Colorbar -> Makeup
    BrandCategoryModel(brandId: '19', categoryId: '13'), // Denver -> Fragrance
    BrandCategoryModel(brandId: '20', categoryId: '14'), // Elle 18 -> Nails
    BrandCategoryModel(brandId: '21', categoryId: '13'), // Engage -> Fragrance
    BrandCategoryModel(
      brandId: '22',
      categoryId: '11',
    ), // Faces Canada -> Makeup
    BrandCategoryModel(brandId: '24', categoryId: '16'), // Fiama -> Soap
    BrandCategoryModel(brandId: '26', categoryId: '13'), // Fogg -> Fragrance
    BrandCategoryModel(
      brandId: '27',
      categoryId: '13',
    ), // Forest Essentials -> Fragrance
    BrandCategoryModel(brandId: '28', categoryId: '15'), // Gillette -> Grooming
    BrandCategoryModel(brandId: '30', categoryId: '10'), // Good Vibes -> Skin
    BrandCategoryModel(brandId: '31', categoryId: '10'), // Himalaya -> Skin
    BrandCategoryModel(brandId: '35', categoryId: '12'), // Indulekha -> Hair
    BrandCategoryModel(brandId: '36', categoryId: '11'), // Insight -> Makeup
    BrandCategoryModel(brandId: '37', categoryId: '11'), // Just Herbs -> Makeup
    BrandCategoryModel(brandId: '38', categoryId: '16'), // Khadi -> Soap
    BrandCategoryModel(brandId: '40', categoryId: '10'), // Lakme -> Skin
    BrandCategoryModel(brandId: '40', categoryId: '11'), // Lakme -> Makeup
    BrandCategoryModel(brandId: '44', categoryId: '16'), // Lifebuoy -> Soap
    BrandCategoryModel(brandId: '47', categoryId: '10'), // Lotus -> Skin
    BrandCategoryModel(brandId: '49', categoryId: '16'), // Lux -> Soap
    BrandCategoryModel(brandId: '50', categoryId: '12'), // Mamaearth -> Hair
    BrandCategoryModel(brandId: '50', categoryId: '10'), // Mamaearth -> Skin
    BrandCategoryModel(
      brandId: '51',
      categoryId: '15',
    ), // Man Arden -> Grooming
    BrandCategoryModel(brandId: '52', categoryId: '11'), // Mars -> Makeup
    BrandCategoryModel(
      brandId: '55',
      categoryId: '15',
    ), // Mi -> Grooming (Trimmer)
    BrandCategoryModel(brandId: '57', categoryId: '10'), // Minimalist -> Skin
    BrandCategoryModel(brandId: '61', categoryId: '11'), // MyGlamm -> Makeup
    BrandCategoryModel(brandId: '63', categoryId: '11'), // Nykaa -> Makeup
    BrandCategoryModel(brandId: '65', categoryId: '12'), // Park Avenue -> Hair
    BrandCategoryModel(brandId: '66', categoryId: '16'), // Pears -> Soap
    BrandCategoryModel(brandId: '68', categoryId: '10'), // Plum -> Skin
    BrandCategoryModel(brandId: '77', categoryId: '16'), // Santoor -> Soap
    BrandCategoryModel(brandId: '78', categoryId: '13'), // Skinn -> Fragrance
    BrandCategoryModel(brandId: '81', categoryId: '12'), // Streax -> Hair
    BrandCategoryModel(brandId: '82', categoryId: '11'), // Sugar -> Makeup
    BrandCategoryModel(
      brandId: '83',
      categoryId: '11',
    ), // Swiss Beauty -> Makeup
    BrandCategoryModel(brandId: '85', categoryId: '15'), // TMC -> Grooming
    BrandCategoryModel(brandId: '86', categoryId: '12'), // Tresemme -> Hair
    BrandCategoryModel(
      brandId: '87',
      categoryId: '15',
    ), // UrbanGabru -> Grooming
    BrandCategoryModel(brandId: '89', categoryId: '13'), // Ustraa -> Fragrance
    BrandCategoryModel(
      brandId: '93',
      categoryId: '13',
    ), // Wild Stone -> Fragrance
    BrandCategoryModel(brandId: '95', categoryId: '12'), // WOW -> Hair
  ];

  // --- 2. PRODUCT CATEGORY RELATIONSHIPS ---
  static final List<ProductCategoryModel> productCategory = [
    // =============================================================
    // 1. PARENT CATEGORY LINKS (MANDATORY FOR "YOU MIGHT LIKE" GRID)
    // =============================================================

    // --- TRAVEL (ID: 1) ---
    ProductCategoryModel(productId: 'p7', categoryId: '1'), // Ambrane Powerbank
    ProductCategoryModel(
      productId: 'p9',
      categoryId: '1',
    ), // American Tourister Luggage
    ProductCategoryModel(
      productId: 'p11',
      categoryId: '1',
    ), // Aristocrat Suitcase
    ProductCategoryModel(productId: 'p24', categoryId: '1'), // Boat Headphones
    ProductCategoryModel(productId: 'p36', categoryId: '1'), // F Gear Backpack
    ProductCategoryModel(productId: 'p58', categoryId: '1'), // Lava Phone
    ProductCategoryModel(productId: 'p59', categoryId: '1'), // Lavie Duffle
    ProductCategoryModel(productId: 'p74', categoryId: '1'), // Mi Band
    ProductCategoryModel(productId: 'p99', categoryId: '1'), // Safari Trolley
    ProductCategoryModel(productId: 'p116', categoryId: '1'), // VIP Duffle
    ProductCategoryModel(
      productId: 'p117',
      categoryId: '1',
    ), // Wildcraft Rucksack
    // --- CLOTHING (ID: 5) ---
    ProductCategoryModel(productId: 'p1', categoryId: '5'), // Adidas Shoes
    ProductCategoryModel(productId: 'p2', categoryId: '5'), // Adidas Pants
    ProductCategoryModel(productId: 'p5', categoryId: '5'), // Allen Solly Shirt
    ProductCategoryModel(
      productId: 'p6',
      categoryId: '5',
    ), // Allen Solly Chinos
    ProductCategoryModel(productId: 'p12', categoryId: '5'), // Aurelia Kurti
    ProductCategoryModel(productId: 'p19', categoryId: '5'), // Biba Suit
    ProductCategoryModel(productId: 'p27', categoryId: '5'), // Campus Hoodie
    ProductCategoryModel(productId: 'p30', categoryId: '5'), // Decathlon Tee
    ProductCategoryModel(productId: 'p48', categoryId: '5'), // LP Belt
    ProductCategoryModel(productId: 'p54', categoryId: '5'), // Killer Jeans
    ProductCategoryModel(productId: 'p60', categoryId: '5'), // Mufti Jeans
    ProductCategoryModel(productId: 'p71', categoryId: '5'), // Puma Shoes
    ProductCategoryModel(productId: 'p88', categoryId: '5'), // US Polo T-Shirt
    ProductCategoryModel(productId: 'p94', categoryId: '5'), // Rangriti Skirt
    ProductCategoryModel(
      productId: 'p96',
      categoryId: '5',
    ), // Red Tape Sneakers
    ProductCategoryModel(
      productId: 'p115',
      categoryId: '5',
    ), // Van Heusen Innerwear
    ProductCategoryModel(productId: 'p120', categoryId: '5'), // Woodland Boots
    ProductCategoryModel(productId: 'p125', categoryId: '5'), // Zivame Bra
    ProductCategoryModel(
      productId: 'p127',
      categoryId: '5',
    ), // Zudio Flip Flops
    // --- BEAUTY (ID: 9) ---
    ProductCategoryModel(productId: 'p3', categoryId: '9'), // Ajmal Perfume
    ProductCategoryModel(productId: 'p16', categoryId: '9'), // Beardo Oil
    ProductCategoryModel(
      productId: 'p21',
      categoryId: '9',
    ), // Biotique Face Wash
    ProductCategoryModel(
      productId: 'p23',
      categoryId: '9',
    ), // Blue Heaven Kajal
    ProductCategoryModel(
      productId: 'p29',
      categoryId: '9',
    ), // Colorbar Lipstick
    ProductCategoryModel(productId: 'p32', categoryId: '9'), // Denver Deo
    ProductCategoryModel(
      productId: 'p40',
      categoryId: '9',
    ), // Forest Essentials
    ProductCategoryModel(productId: 'p41', categoryId: '9'), // Gillette Razor
    ProductCategoryModel(productId: 'p50', categoryId: '9'), // Mamaearth Oil
    ProductCategoryModel(productId: 'p56', categoryId: '9'), // Lakme Sunscreen
    ProductCategoryModel(productId: 'p82', categoryId: '9'), // MyGlamm Lipstick
    ProductCategoryModel(productId: 'p84', categoryId: '9'), // Nykaa Eyeliner
    ProductCategoryModel(productId: 'p89', categoryId: '9'), // Plum Mask
    ProductCategoryModel(productId: 'p122', categoryId: '9'), // WOW Shampoo
    // =============================================================
    // 2. SUB-CATEGORY LINKS (Original List - Keep this for filters)
    // =============================================================
    ProductCategoryModel(productId: 'p1', categoryId: '22'),
    ProductCategoryModel(productId: 'p2', categoryId: '19'),
    ProductCategoryModel(productId: 'p3', categoryId: '13'),
    ProductCategoryModel(productId: 'p4', categoryId: '13'),
    ProductCategoryModel(productId: 'p5', categoryId: '17'),
    ProductCategoryModel(productId: 'p6', categoryId: '19'),
    ProductCategoryModel(productId: 'p7', categoryId: '4'),
    ProductCategoryModel(productId: 'p8', categoryId: '4'),
    ProductCategoryModel(productId: 'p9', categoryId: '2'),
    ProductCategoryModel(productId: 'p10', categoryId: '2'),
    ProductCategoryModel(productId: 'p11', categoryId: '2'),
    ProductCategoryModel(productId: 'p12', categoryId: '27'),
    ProductCategoryModel(productId: 'p13', categoryId: '27'),
    ProductCategoryModel(productId: 'p14', categoryId: '31'),
    ProductCategoryModel(productId: 'p15', categoryId: '31'),
    ProductCategoryModel(productId: 'p16', categoryId: '15'),
    ProductCategoryModel(productId: 'p17', categoryId: '15'),
    ProductCategoryModel(productId: 'p18', categoryId: '13'),
    ProductCategoryModel(productId: 'p19', categoryId: '23'),
    ProductCategoryModel(productId: 'p20', categoryId: '27'),
    ProductCategoryModel(productId: 'p21', categoryId: '10'),
    ProductCategoryModel(productId: 'p22', categoryId: '12'),
    ProductCategoryModel(productId: 'p23', categoryId: '11'),
    ProductCategoryModel(productId: 'p24', categoryId: '4'),
    ProductCategoryModel(productId: 'p25', categoryId: '4'),
    ProductCategoryModel(productId: 'p26', categoryId: '16'),
    ProductCategoryModel(productId: 'p27', categoryId: '21'),
    ProductCategoryModel(productId: 'p28', categoryId: '19'),
    ProductCategoryModel(productId: 'p29', categoryId: '11'),
    ProductCategoryModel(productId: 'p30', categoryId: '18'),
    ProductCategoryModel(productId: 'p31', categoryId: '18'),
    ProductCategoryModel(productId: 'p32', categoryId: '13'),
    ProductCategoryModel(productId: 'p33', categoryId: '14'),
    ProductCategoryModel(productId: 'p34', categoryId: '13'),
    ProductCategoryModel(productId: 'p35', categoryId: '11'),
    ProductCategoryModel(productId: 'p36', categoryId: '2'),
    ProductCategoryModel(productId: 'p37', categoryId: '16'),
    ProductCategoryModel(productId: 'p38', categoryId: '31'),
    ProductCategoryModel(productId: 'p39', categoryId: '13'),
    ProductCategoryModel(productId: 'p40', categoryId: '13'),
    ProductCategoryModel(productId: 'p41', categoryId: '15'),
    ProductCategoryModel(productId: 'p42', categoryId: '29'),
    ProductCategoryModel(productId: 'p43', categoryId: '29'),
    ProductCategoryModel(productId: 'p44', categoryId: '10'),
    ProductCategoryModel(productId: 'p45', categoryId: '10'),
    ProductCategoryModel(productId: 'p46', categoryId: '31'),
    ProductCategoryModel(productId: 'p47', categoryId: '30'),
    ProductCategoryModel(productId: 'p48', categoryId: '22'),
    ProductCategoryModel(productId: 'p49', categoryId: '18'),
    ProductCategoryModel(productId: 'p50', categoryId: '12'),
    ProductCategoryModel(productId: 'p51', categoryId: '11'),
    ProductCategoryModel(productId: 'p52', categoryId: '11'),
    ProductCategoryModel(productId: 'p53', categoryId: '16'),
    ProductCategoryModel(productId: 'p54', categoryId: '20'),
    ProductCategoryModel(productId: 'p55', categoryId: '21'),
    ProductCategoryModel(productId: 'p56', categoryId: '10'),
    ProductCategoryModel(productId: 'p57', categoryId: '11'),
    ProductCategoryModel(productId: 'p58', categoryId: '4'),
    ProductCategoryModel(productId: 'p59', categoryId: '2'),
    ProductCategoryModel(productId: 'p60', categoryId: '27'),
    ProductCategoryModel(productId: 'p61', categoryId: '16'),
    ProductCategoryModel(productId: 'p62', categoryId: '31'),
    ProductCategoryModel(productId: 'p63', categoryId: '30'),
    ProductCategoryModel(productId: 'p64', categoryId: '10'),
    ProductCategoryModel(productId: 'p65', categoryId: '6'),
    ProductCategoryModel(productId: 'p66', categoryId: '6'),
    ProductCategoryModel(productId: 'p67', categoryId: '16'),
    ProductCategoryModel(productId: 'p68', categoryId: '12'),
    ProductCategoryModel(productId: 'p69', categoryId: '10'),
    ProductCategoryModel(productId: 'p70', categoryId: '15'),
    ProductCategoryModel(productId: 'p71', categoryId: '11'),
    ProductCategoryModel(productId: 'p72', categoryId: '32'),
    ProductCategoryModel(productId: 'p73', categoryId: '27'),
    ProductCategoryModel(productId: 'p74', categoryId: '4'),
    ProductCategoryModel(productId: 'p75', categoryId: '15'),
    ProductCategoryModel(productId: 'p76', categoryId: '4'),
    ProductCategoryModel(productId: 'p77', categoryId: '10'),
    ProductCategoryModel(productId: 'p78', categoryId: '10'),
    ProductCategoryModel(productId: 'p79', categoryId: '21'),
    ProductCategoryModel(productId: 'p80', categoryId: '31'),
    ProductCategoryModel(productId: 'p81', categoryId: '20'),
    ProductCategoryModel(productId: 'p82', categoryId: '11'),
    ProductCategoryModel(productId: 'p83', categoryId: '4'),
    ProductCategoryModel(productId: 'p84', categoryId: '11'),
    ProductCategoryModel(productId: 'p85', categoryId: '29'),
    ProductCategoryModel(productId: 'p86', categoryId: '12'),
    ProductCategoryModel(productId: 'p87', categoryId: '16'),
    ProductCategoryModel(productId: 'p88', categoryId: '17'),
    ProductCategoryModel(productId: 'p89', categoryId: '10'),
    ProductCategoryModel(productId: 'p90', categoryId: '4'),
    ProductCategoryModel(productId: 'p91', categoryId: '4'),
    ProductCategoryModel(productId: 'p92', categoryId: '22'),
    ProductCategoryModel(productId: 'p93', categoryId: '22'),
    ProductCategoryModel(productId: 'p94', categoryId: '25'),
    ProductCategoryModel(productId: 'p95', categoryId: '6'),
    ProductCategoryModel(productId: 'p96', categoryId: '22'),
    ProductCategoryModel(productId: 'p97', categoryId: '18'),
    ProductCategoryModel(productId: 'p98', categoryId: '20'),
    ProductCategoryModel(productId: 'p99', categoryId: '2'),
    ProductCategoryModel(productId: 'p100', categoryId: '16'),
    ProductCategoryModel(productId: 'p101', categoryId: '13'),
    ProductCategoryModel(productId: 'p102', categoryId: '2'),
    ProductCategoryModel(productId: 'p103', categoryId: '26'),
    ProductCategoryModel(productId: 'p104', categoryId: '12'),
    ProductCategoryModel(productId: 'p105', categoryId: '11'),
    ProductCategoryModel(productId: 'p106', categoryId: '11'),
    ProductCategoryModel(productId: 'p107', categoryId: '4'),
    ProductCategoryModel(productId: 'p108', categoryId: '15'),
    ProductCategoryModel(productId: 'p109', categoryId: '12'),
    ProductCategoryModel(productId: 'p110', categoryId: '15'),
    ProductCategoryModel(productId: 'p111', categoryId: '18'),
    ProductCategoryModel(productId: 'p112', categoryId: '20'),
    ProductCategoryModel(productId: 'p113', categoryId: '13'),
    ProductCategoryModel(productId: 'p114', categoryId: '17'),
    ProductCategoryModel(productId: 'p115', categoryId: '6'),
    ProductCategoryModel(productId: 'p116', categoryId: '2'),
    ProductCategoryModel(productId: 'p117', categoryId: '2'),
    ProductCategoryModel(productId: 'p118', categoryId: '21'),
    ProductCategoryModel(productId: 'p119', categoryId: '13'),
    ProductCategoryModel(productId: 'p120', categoryId: '22'),
    ProductCategoryModel(productId: 'p121', categoryId: '6'),
    ProductCategoryModel(productId: 'p122', categoryId: '12'),
    ProductCategoryModel(productId: 'p123', categoryId: '4'),
    ProductCategoryModel(productId: 'p124', categoryId: '4'),
    ProductCategoryModel(productId: 'p125', categoryId: '24'),
    ProductCategoryModel(productId: 'p126', categoryId: '27'),
    ProductCategoryModel(productId: 'p127', categoryId: '22'),
    ProductCategoryModel(productId: 'p128', categoryId: '18'),

    // Fix for Travel Clothing (ID: 3)
    ProductCategoryModel(
      productId: 'p118',
      categoryId: '3',
    ), // Wildcraft Jacket
    ProductCategoryModel(
      productId: 'p27',
      categoryId: '3',
    ), // Campus Sutra Hoodie
    ProductCategoryModel(
      productId: 'p30',
      categoryId: '3',
    ), // Decathlon Sport Tee
    // =============================================================
    // FIX: MISSING PARENT LINKS FOR WOMEN (ID 7) & KIDS (ID 8)
    // =============================================================

    // --- WOMEN'S FASHION (Category ID: 7) ---
    ProductCategoryModel(productId: 'p12', categoryId: '7'), // Aurelia Kurti
    ProductCategoryModel(productId: 'p13', categoryId: '7'), // Aurelia Palazzo
    ProductCategoryModel(productId: 'p19', categoryId: '7'), // Biba Suit
    ProductCategoryModel(productId: 'p20', categoryId: '7'), // Biba Dupatta
    ProductCategoryModel(productId: 'p43', categoryId: '7'), // Libas Kurti
    ProductCategoryModel(productId: 'p73', categoryId: '7'), // Melange Kurti
    ProductCategoryModel(productId: 'p94', categoryId: '7'), // Rangriti Skirt
    ProductCategoryModel(productId: 'p103', categoryId: '7'), // Soch Saree
    ProductCategoryModel(productId: 'p125', categoryId: '7'), // Zivame Bra
    ProductCategoryModel(
      productId: 'p126',
      categoryId: '7',
    ), // Zivame Nightwear
    // --- KIDS FASHION (Category ID: 8) ---
    ProductCategoryModel(productId: 'p14', categoryId: '8'), // Babyhug Romper
    ProductCategoryModel(productId: 'p15', categoryId: '8'), // Babyhug Bottle
    ProductCategoryModel(productId: 'p38', categoryId: '8'), // Firstcry Diapers
    ProductCategoryModel(productId: 'p42', categoryId: '8'), // Gini Jony Jeans
    ProductCategoryModel(productId: 'p43', categoryId: '8'), // Gini Jony Tee
    ProductCategoryModel(productId: 'p46', categoryId: '8'), // Hopkids Mittens
    ProductCategoryModel(productId: 'p47', categoryId: '8'), // Hopscotch Dress
    ProductCategoryModel(productId: 'p62', categoryId: '8'), // Lilliput Suit
    ProductCategoryModel(
      productId: 'p63',
      categoryId: '8',
    ), // Little Kangaroos Toy
    ProductCategoryModel(productId: 'p72', categoryId: '8'), // Maxx Socks
    ProductCategoryModel(
      productId: 'p80',
      categoryId: '8',
    ), // Mothercare Blanket
    ProductCategoryModel(
      productId: 'p85',
      categoryId: '8',
    ), // Pantaloons Shorts
  ];
}
