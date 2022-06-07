# front
https://github.com/yuki-snow1823/techpit-todoapp


## Build Setup

```bash
# install dependencies
$ npm install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start

# generate static project
$ npm run generate
```

For detailed explanation on how things work, check out the [documentation](https://nuxtjs.org).

## Special Directories

You can create the following extra directories, some of which have special behaviors. Only `pages` is required; you can delete them if you don't want to use their functionality.

### `assets`

The assets directory contains your uncompiled assets such as Stylus or Sass files, images, or fonts.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/assets).

### `components`

The components directory contains your Vue.js components. Components make up the different parts of your page and can be reused and imported into your pages, layouts and even other components.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/components).

### `layouts`

Layouts are a great help when you want to change the look and feel of your Nuxt app, whether you want to include a sidebar or have distinct layouts for mobile and desktop.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/layouts).


### `pages`

This directory contains your application views and routes. Nuxt will read all the `*.vue` files inside this directory and setup Vue Router automatically.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/get-started/routing).

### `plugins`

The plugins directory contains JavaScript plugins that you want to run before instantiating the root Vue.js Application. This is the place to add Vue plugins and to inject functions or constants. Every time you need to use `Vue.use()`, you should create a file in `plugins/` and add its path to plugins in `nuxt.config.js`.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/plugins).

### `static`

This directory contains your static files. Each file inside this directory is mapped to `/`.

Example: `/static/robots.txt` is mapped as `/robots.txt`.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/static).

### `store`

This directory contains your Vuex store files. Creating a file in this directory automatically activates Vuex.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/store).



まず、authCheck.jsの解説です。

FirebaseのonAuthStateChangedを使うことで、ログイン状態のユーザーの情報をFirebaseへ確認しに行っています。
今回は、userが存在する＝ログインしていれば、/v1/usersにFirebaseから取得してきたuid情報を使って、GETリクエストを送ります。

APIの処理は後述しますが、正しいuidがDBに記録されていればユーザー情報を返してくれます。
その後は、ユーザー情報をstore.dispatch("auth/setUser", data)を通して先ほど作成したauth.jsのsetUserアクションに適用させています。

この一連の動作により、storeのactionにユーザーの情報が渡り、mutation、stateの順番でイベントが伝わってログインの情報がVuexに保持されます。

次に、nuxt.config.jsです。

plugins:のところに、pluginsのディレクトリに配置したファイルを記載すると、リロードするたびに毎回呼び出してくれます。
コンポーネントの描画の前に呼び出されて、ユーザーのログイン状態を確認できるようになるので、コンポーネントを描画する際に「ユーザーの情報がない！」なんてことにならなくて済みます。

もっと細かく解説しますと、例えばユーザーの情報をもとにTODOやユーザー名を表示させようとした際に、ユーザーの情報がないと画面を描画できません。
Vue.jsではそういった「読み込み順」がとても大切になる訳です。

authCheck.jsでユーザー情報を取得するためのコードを書き、nuxt.config.jsに記載していつでも呼び出してくれるようになりました。