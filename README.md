# education-system-frontend

> 系统为简易的基于微信教务系统，这里是前端模块，基于vue以及vue组件库element-ui，打包工具webpack。后台模块在[这里](https://github.com/zouyifeng/education-system-backend)。 


请支持下点个star哈~

## 启动

``` bash
# install dependencies
npm install

# 访问localhost:8080，由于开启代理，开发模式下请求直接代理到后台（须将后台模块运行起来）
npm run dev

# build for production with minification
npm run build
```


## 功能

* 登录/登出
* 权限验证
* 侧边栏
* 富文本编辑器
* 请求代理
* 七牛云文件上传
* 微信模板消息推送
* 微信登陆验证
* 微信端在线翻译
* ...


## 注意

本地静态服务器跑起来时，是通过代理服务器将ajax请求对接到对应的[后台模块](https://github.com/zouyifeng/education-system-backend)，此处需要将后台模块部署到Tomcat服务器并同时运行（[如何运行后台模块](https://github.com/zouyifeng/education-system-backend)），才能对网站进行交互操作。


## 预览

### 校园动态模板消息和微信端动态详情
管理员在后台登陆后，发布一条新闻，已关注公众号的粉丝微信将接收到一条消息推送，点击查看详情。

![校园动态模板消息](https://img-1253403808.cos.ap-chengdu.myqcloud.com/%E6%A0%A1%E5%9B%AD%E5%8A%A8%E6%80%81%E6%A8%A1%E6%9D%BF%E6%B6%88%E6%81%AF.png)
![微信端动态详情](https://img-1253403808.cos.ap-chengdu.myqcloud.com/%E5%BE%AE%E4%BF%A1%E7%AB%AF%E5%8A%A8%E6%80%81%E8%AF%A6%E6%83%85.jpg)


### 新增教师
新增教师个人信息，上传图片，参加班级。

![新增教师](https://img-1253403808.cos.ap-chengdu.myqcloud.com/%E6%96%B0%E5%A2%9E%E6%95%99%E5%B8%88.png)


### 管理员编辑新闻
管理员编辑新闻，可上传图片。上传完成后可推送到微信端。

![管理员编辑新闻](https://img-1253403808.cos.ap-chengdu.myqcloud.com/%E7%AE%A1%E7%90%86%E5%91%98%E7%BC%96%E8%BE%91%E6%96%B0%E9%97%BB.png)


### 班级课程表
查看本班该周的课程。

![班级课程表](https://img-1253403808.cos.ap-chengdu.myqcloud.com/%E7%8F%AD%E7%BA%A7%E8%AF%BE%E7%A8%8B%E8%A1%A8.png)


### 班级排课页面
选定班级后，按照课时数，上课周期和规则，生成课时。

![班级排课页面](https://img-1253403808.cos.ap-chengdu.myqcloud.com/%E7%8F%AD%E7%BA%A7%E6%8E%92%E8%AF%BE%E9%A1%B5%E9%9D%A2.png)
