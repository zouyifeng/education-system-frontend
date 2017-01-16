<template>
    <div class="container">
        <form class="form-signin">
            <h2 class="form-signin-heading">{{title}}</h2>
            <label for="username" class="sr-only">用户名</label>
            <input type="email" v-model="username" id="username" class="form-control" placeholder="用户名" required autofocus>
            <label for="password" class="sr-only">密码</label>
            <input type="password" v-model="password" id="password" class="form-control" placeholder="密码" required>
            <div class="checkbox">
                <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        </form>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                // note: changing this line won't causes changes
                // with hot-reload because the reloaded component
                // preserves its current state and we are modifying
                // its initial state.
                title: '系统登录',
                username: '',
                password: ''
            }
        }
    }
</script>

<style>
    body {
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #eee;
    }

    .form-signin {
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
    margin-bottom: 10px;
    }
    .form-signin .checkbox {
    font-weight: normal;
    }
    .form-signin .form-control {
    position: relative;
    height: auto;
    -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
            box-sizing: border-box;
    padding: 10px;
    font-size: 16px;
    }
    .form-signin .form-control:focus {
    z-index: 2;
    }
    .form-signin input[type="email"] {
    margin-bottom: -1px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    }
</style>