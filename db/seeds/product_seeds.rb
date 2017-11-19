# --=== 產品（Product）資料 ===-- #

 # 創建產品
 Product.create!(
   title: "J & A SELECT x Pelikan 聯名限量版 鋼珠筆",
   description:
   "J & A SELECT 貫徹「講究生活裡細微的美好」的選物職人精神，為你搜羅來自歐美、日本、台灣等地的夢幻逸品，用文具改變你的桌上風景。",
   price: 270,
   quantity: 4
 )
 puts "創建商品 * 1"
 Product.create!(title: 'QC-35',
                 description: '耳机',
                 price: 2800,
                 quantity: 5,
                 image: open('https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg'))
 puts "創建商品 * 2"
 Product.create!(title: 'Iphone7',
                 description: '手机',
                 price: 5000,
                 quantity: 5,
                 image: open('https://images-cn.ssl-images-amazon.com/images/I/51q3gdJGenL._SL800_.jpg'))
 puts "創建商品 * 3"
 Product.create!(title: 'Cherry Keyboard',
                 description: 'G80-3000键盘',
                 price: 2800,
                 quantity: 5,
                 image: open('https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg'))
 puts "創建商品 * 4"
