import Vue from 'vue'

const environment = process.env.NODE_ENV || 'development'

export const Graphql = Vue.extend({
  methods: {
    changeToken() {
      return new Promise((resolve) => {
        if (typeof getRequestToken === 'undefined') {
          // トークン生成用関数を定義
          window.getRequestToken_callback = (token) => {
            if (token === null || token === undefined || token === '') {
              resolve('dummy')
            }
            resolve(token)
          }

          if (environment === 'development') {
            resolve('dummy')
            return
          }

          // uniwebview://uuidに遷移させる
          location.href = 'uniwebview://uuid'
          return
        }
        // eslint-disable-next-line no-undef
        getRequestToken((token) => {
          resolve(token)
        })
      })
    },
    $requestGraphql(gql, variables, primary) {
      // primaryが指定されたらPrimaryを参照するようにヘッダーをセット
      if (primary) {
        this.$graphql.setHeader('primary', 'true')
      } else {
        this.$graphql.setHeader('primary', 'false')
      }

      return this.changeToken().then((token) => {
        return this.$doRequest(gql, variables, token)
      })
    },
    $doRequest(gql, variables, token) {
      this.$graphql.setHeader('system', 'webview')
      this.$graphql.setHeader('authorization', token)
      return this.$graphql.request(gql, variables)
    },
  },
})
