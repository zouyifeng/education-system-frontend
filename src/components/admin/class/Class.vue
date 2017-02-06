<template>
    <div class="panel panel-default">
        <div class="panel-heading">班级管理</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <label for="name">班级名称</label>
                    <input type="text" class="form-control" id="name" placeholder="班级名称">
                </div>
                <div class="form-group">
                    <label for="address">班级地点</label>
                    <input type="email" class="form-control" id="address" placeholder="班级地点">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
                <router-link to="/admin/editClass" class="btn btn-primary">新增</router-link>                    
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>班级名称</th>
                        <th>班级地点</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>