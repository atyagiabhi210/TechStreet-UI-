import '../models/brand.dart';
import '../models/product.dart';

List<Brand> brands = [
  Brand(
    name: 'Apple',
    iconURL:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_2c_EC7Z6KnN-eUZHPKeJMTfk3dCrB8niHQ&s",
  ),
  Brand(
    name: 'Dell',
    iconURL:
        "https://assets.gadgets360cdn.com/content/assets/brands/dell_1617875747.jpg?downsize=170:*",
  ),
  Brand(
    name: 'HP',
    iconURL:
        "https://assets.gadgets360cdn.com/content/assets/brands/hp_1617875771.jpg?downsize=170:*",
  ),
  Brand(
    name: 'Lenovo',
    iconURL:
        "https://assets.gadgets360cdn.com/content/assets/brands/lenovo_1617875812.jpg?downsize=170:*",
  ),
  Brand(
    name: 'Asus',
    iconURL:
        "https://assets.gadgets360cdn.com/content/assets/brands/asus_1617875728.jpg?downsize=*:90",
  ),
  Brand(
    name: 'Acer',
    iconURL:
        "https://assets.gadgets360cdn.com/content/assets/brands/acer_1617875680.jpg?downsize=*:90",
  )
];

List<Product> products = [
  Product(
      name: "MacBook Pro 16-inch",
      brand: "Apple",
      price: 2400,
      category: "Laptop",
      reviews: 150,
      rating: 4.7,
      description:
          "The MacBook Pro 16-inch is a powerful laptop with a stunning Retina display, advanced Intel or M1 Pro/M1 Max processors, and a battery life that lasts all day. It's designed for professionals who need top performance and a versatile machine.",
      image:
          "https://ik.imagekit.io/3dqckpw4d/upload/16-inch_macbook_pro-_Space_Black1699276145Untitled%20design%20(46).png"),
  Product(
      name: "Dell XPS 15",
      brand: "Dell",
      price: 2000,
      category: "Laptop",
      reviews: 120,
      rating: 4.6,
      description:
          "The Dell XPS 15 offers an exceptional display, premium build quality, and powerful performance, making it an ideal choice for creators and professionals. It features the latest Intel processors and an ultra-thin bezel display.",
      image:
          "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/xps-notebooks/xps-15-9530/media-gallery/touch-black/notebook-xps-15-9530-t-black-gallery-1.psd?fmt=pjpg&pscan=auto&scl=1&wid=3778&hei=2323&qlt=100,1&resMode=sharp2&size=3778,2323&chrss=full&imwidth=5000"),
  Product(
      name: "HP Spectre x360",
      brand: "HP",
      price: 1600,
      category: "Laptop",
      reviews: 100,
      rating: 4.5,
      description:
          "The HP Spectre x360 is a versatile 2-in-1 laptop with a sleek design and powerful performance. It features a 360-degree hinge, allowing you to use it as a tablet or a traditional laptop, and includes a stylus for creative tasks.",
      image:
          "https://computechstore.in/wp-content/uploads/2022/12/HP-Spectre-x360-1.jpg"),
  Product(
      name: "Lenovo ThinkPad X1 Carbon",
      brand: "Lenovo",
      price: 1800,
      category: "Laptop",
      reviews: 110,
      rating: 4.7,
      description:
          "The Lenovo ThinkPad X1 Carbon is a lightweight and durable laptop, perfect for business professionals. It offers a powerful Intel processor, long battery life, and a stunning display, all packed into a thin and light design.",
      image:
          "https://cdn.cs.1worldsync.com/syndication/mediaserverredirect/c18a9696052fb5c263010ce343fe35c7/original.png"),
  Product(
    name: "Asus ROG Zephyrus G14",
    brand: "Asus",
    price: 1500,
    category: "Laptop",
    reviews: 130,
    rating: 4.6,
    description:
        "The Asus ROG Zephyrus G14 is a powerful gaming laptop with a compact design. It features an AMD Ryzen processor, Nvidia GeForce GPU, and a high refresh rate display, making it ideal for gaming on the go.",
    image: "https://m.media-amazon.com/images/I/81VvyjgQR4L.jpg",
  ),
  Product(
      name: "Acer Swift 3",
      brand: "Acer",
      price: 900,
      category: "Laptop",
      reviews: 85,
      rating: 4.3,
      description:
          "The Acer Swift 3 is a budget-friendly laptop that doesn't compromise on performance. It offers a sleek design, decent battery life, and an Intel or AMD processor, making it a great choice for students and professionals alike.",
      image: "https://m.media-amazon.com/images/I/81nN5u1MEuL.jpg"),
];

List<Product> favorite = [];
List<Product> cartItems = [];
