//维护接口的文件

const serviceUrl = 'https://wxmini.baixingliangfan.cn/baixing/';

const servicePath = {
  'homePageContent': serviceUrl + 'wxmini/homePageContent', // 首页信息
  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten', //商城首页热卖商品拉取
  'getCategory': serviceUrl + 'wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl+'wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById': serviceUrl + 'wxmini/getGoodDetailById', // 商品详情接口
};

