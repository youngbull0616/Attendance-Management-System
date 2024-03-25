<template>
  <div>
    <div style="text-align: left; margin-left: 20px;">
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" @click="handleCreate()"> 发起申请</el-button>
    </div>
    <div style="display: flex; flex-direction: row; flex-wrap: wrap;">
      <el-card class="box-card" v-for="item in tableData" :key="item.id" style="width: 450px; margin: 20px;">
        <template #header>
          <div class="card-header">
            <span style="color: green; float: left;" v-if="item.isPass">{{ item.statusName }}</span>
            <span style="color: gray; float: left;" v-else-if="item.isNotApproval">{{ item.statusName }}</span>
            <span style="color: red; float: left;" v-else>{{ item.statusName }}</span>
            <span>{{ ruleForm.employeeName }}的{{item.month}}月绩效考核申请</span>
            <el-button class="button" type="text" style="float: right; padding: 3px 0"
              @click="handleUpdate(item)">查看详情</el-button>
          </div>
        </template>
        <div class="text item">
          分数：
          {{
            isNaN((parseFloat(item.selfScore) + parseFloat(item.adminScore)) / 2) ? '管理员未打分' : '平均分：' + ((parseFloat(item.selfScore) + parseFloat(item.adminScore)) / 2).toFixed(2)
          }}
        </div>

        <div class="text item">
          {{ '申请时间：' + item.applyTime }}
        </div>
      </el-card>
    </div>
    <el-dialog :title="dialogTitle" :visible.sync="dialogFormVisible">
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm"
        style="width:100%;" v-if="isshowForm">
        <el-form-item label="申请人" prop="employeeName">
          <el-input v-model="ruleForm.employeeName" readonly></el-input>
        </el-form-item>
        <el-form-item label="申请时间" prop="applyTime" v-if="isUpdate">
          <el-input v-model="ruleForm.applyTime" readonly></el-input>
        </el-form-item>
        <el-form-item label="自评得分" prop="selfScore">
          <el-input v-model="ruleForm.selfScore" placeholder="请输入自评得分" :readonly="isUpdate"></el-input>
        </el-form-item>
        <el-form-item label="审批人" prop="approvalName" v-if="isApproval">
          <el-input v-model="ruleForm.approvalName" readonly></el-input>
        </el-form-item>
        <el-form-item label="审批时间" prop="approvalTime" v-if="isApproval">
          <el-input v-model="ruleForm.approvalTime" readonly></el-input>
        </el-form-item>
        <el-form-item label="审批状态" prop="course" v-if="isUpdate">
          <el-input v-model="ruleForm.statusName" :readonly="isUpdate"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="dialogFormVisible = false"> 取 消</el-button>
          <el-button type="primary" @click="submitForm('ruleForm')" v-if="isCreate"> 立即申请</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      tableData: [],
      ruleForm: {
        employeeNumber: sessionStorage.getItem("username"),
        employeeName: '',
        applyTime: this.getTime(),
        taskTypeID: '4',
        status: '',
        approvalID: '',
        adminScore: ''
      },
      rules: {
        selfScore: [
          {
            required: true,
            message: '请输入自评分数0-100',
            trigger: 'blur'
          },
          {
            validator: (rule, value, callback) => {
              const score = parseFloat(value);
              if (isNaN(score)) {
                callback(new Error('分数必须为数字'));
              } else if (score < 0 || score > 100) {
                callback(new Error('分数必须在0到100之间'));
              } else {
                callback();
              }
            },
            trigger: 'blur'
          }
        ]
      },
      form: {
        id: '',
        number: sessionStorage.getItem("username"),
        name: '',
        sex: '',
        birthday: '',
        departmentID: '',
        position: '',
        type: '',
        entryDate: '',
        phone: '',
        address: '',
        password: '',
        checkPass: '',
      },
      isshowForm: true,
      isshowResult: false,
      dialogFormVisible: false,
      dialogTitle: '',
      isPass: false,
      isNotApproval: false,
      isCreate: false,
      isUpdate: false,
      isApproval: false,
      employeeName: '',
      employeeNumber: '',
      typeList: [],
    };
  },
  created() {
    this.getData();
    this.getUsername();
  },
  methods: {
    getData() {
      axios.post('/attendanceAsset/findByEmployeeNumber', {
        employeeNumber: sessionStorage.getItem("username"),
      }).then(res => {
        this.tableData = res.data;
        this.tableData.forEach(item => {
          if (item.status == '0') {
            item.statusName = '待审批'
            item.isNotApproval = true
          } else if (item.status == '1') {
            item.statusName = '已通过'
            item.isPass = true
          } else if (item.status == '2') {
            item.statusName = '已驳回'
          } else if (item.status == '3') {
            item.statusName = '已撤销'
          }
        })
      })
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios.post('/attendanceAsset/insert', this.ruleForm).then(res => {
            if (res.data.code == 200) {
              this.dialogFormVisible = false;
              this.$message({ message: "申请成功", type: "success" });
              this.$refs[formName].resetFields();
              this.ruleForm.employeeName = this.employeeName;
              this.ruleForm.applyTime = this.getTime();
              this.dialogFormVisible = false;
              this.getData();
            } else if (res.data.code == 20005) {
              this.$message({ message: "该编号已存在", type: "error" });
            }
          })
        } else {
          //console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm() {
      this.$refs['ruleForm'].resetFields();
      this.ruleForm.employeeName = this.employeeName;
      this.ruleForm.applyTime = this.getTime();
      this.employeeNumber = sessionStorage.getItem("username");
      this.taskTypeID = '4';
    },
    getUsername() {
      axios.post('/employee/findByNumber', this.form).then(res => {
        this.employeeName = res.data.name;
        this.employeeNumber = res.data.number;
        this.ruleForm.employeeName = res.data.name;
        this.ruleForm.employeeNumber = res.data.number;
      })
    },
    getTime() {
      var date = new Date();
      var seperator1 = "-";
      var seperator2 = ":";
      //以下代码依次是获取当前时间的年月日时分秒
      var year = date.getFullYear();
      var month = date.getMonth() + 1;
      var strDate = date.getDate();
      var minute = date.getMinutes();
      var hour = date.getHours();
      var second = date.getSeconds();
      //固定时间格式
      if (month >= 1 && month <= 9) {
        month = "0" + month;
      }
      if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
      }
      if (hour >= 0 && hour <= 9) {
        hour = "0" + hour;
      }
      if (minute >= 0 && minute <= 9) {
        minute = "0" + minute;
      }
      if (second >= 0 && second <= 9) {
        second = "0" + second;
      }
      var currentdate = year + seperator1 + month + seperator1 + strDate
        + " " + hour + seperator2 + minute + seperator2 + second;
      return currentdate;
    },
    handleCreate() {
      //this.resetForm(this.ruleForm)
      //this.getTypeList()
      //this.resetTemp()
      this.getTypeList()
      this.dialogTitle = "发送申请"
      this.isCreate = true
      this.isUpdate = false
      this.isApproval = false
      this.dialogFormVisible = true
      this.resetForm()
    },
    handleUpdate(row) {

      this.ruleForm = Object.assign({}, row) // copy obj
      this.ruleForm.employeeName = this.employeeName;
      if (this.ruleForm.status == '0') {
        this.isApproval = false
      } else if (this.ruleForm.status == '1' || this.ruleForm.status == '2') {
        this.isApproval = true
      }
      this.dialogTitle = "申请详情"
      this.isUpdate = true
      this.isCreate = false
      this.dialogFormVisible = true
    },
    getTypeList() {
      axios.get('/attendanceAssetType/list').then(res => {
        this.typeList = res.data;
      })
    }
  }
}
</script>
