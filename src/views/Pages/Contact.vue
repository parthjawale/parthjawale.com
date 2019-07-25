<template>
  <div class="contact-me px-2-desktop px-1-mobile pt-5 pb-5-desktop pb-5-mobile b-primary">
    <div class="heading wow fadeIn" data-wow-delay="0.5s">
      <h1 class="heading-super font-primary">Contact Me</h1>
      <h6>
        or mail me at
        <a href="mailto:hello@parthjawale.com">hello@parthjawale.com</a>
      </h6>
    </div>
    <form @submit.prevent="submitForm">
      <div class="inputs pb-2">
        <div class="input-group wow fadeInUp" data-wow-delay="0.7s">
          <label
            for="Name"
            :class="['text-common' ,'input-label', {active: inputs.firstnameActive}]"
          >First Name</label>
          <input
            autocomplete="off"
            class="text-common"
            type="text"
            v-model="formData.firstname"
            placeholder="What's your first name?"
            @input="inputChanged('firstname')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="0.9s">
          <label
            for="Name"
            :class="['text-common' ,'input-label', {active: inputs.lastnameActive}]"
          >Last Name</label>
          <input
            autocomplete="off"
            class="text-common"
            type="text"
            v-model="formData.lastname"
            placeholder="What's your last name?"
            @input="inputChanged('lastname')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="1.1s">
          <label
            for="Name"
            :class="['text-common' ,'input-label', {active: inputs.emailActive}, {invalid: !emailValid}]"
          >
            Email Address
            <i :class="['fas' ,'fa-exclamation-circle', {invalid:!emailValid}]"></i>
          </label>
          <input
            autocomplete="off"
            :class="['text-common', {invalid: !emailValid}]"
            type="text"
            v-model="formData.email"
            placeholder="What's your email address?"
            @input="inputChanged('email')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="1.3s">
          <label
            for="Name"
            :class="['text-common' ,'input-label', {active: inputs.messageActive}]"
          >Message</label>
          <textarea
            autocomplete="off"
            class="text-common"
            type="text"
            rows="1"
            v-model="formData.message"
            placeholder="What do you want to tell me?"
            @input="inputChanged('message')"
          />
        </div>
      </div>
      <button
        type="submit"
        :class="['btn-large', 'font-primary', 'wow', 'fadeInUp',{active:formValid}, {'pointer-none': !formValid}]"
        data-wow-delay="0.3s"
      >Send</button>
    </form>
    <div class="text-common email pt-2 wow fadeInUp" data-wow-delay="0.5s">
      <a href="mailto:hello@parthjawale.com">
        <span class="email-text">I prefer good old-fashioned email.</span>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    formData: {
      firstname: "",
      lastname: "",
      email: "",
      message: ""
    },
    inputs: {
      firstnameActive: false,
      lastnameActive: false,
      emailActive: false,
      messageActive: false
    },
    emailValid: true
  }),
  computed: {
    formValid() {
      for (let i in this.inputs) {
        if (
          this.inputs[i] == "" ||
          this.inputs[i] == null ||
          this.inputs[i] == undefined
        )
          return false;
        if (i == "email") {
          if (this.validEmail(i) != "" && !this.validEmail(i)) return false;
        }
      }
      return true;
    }
  },
  methods: {
    validEmail(email) {
      var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      let res = re.test(email.toLowerCase());
      return res;
    },
    inputChanged(input) {
      if (
        this.formData[input] != "" &&
        this.formData[input] != undefined &&
        this.formData[input] != null &&
        input != "email"
      ) {
        this.inputs[`${input}Active`] = true;
      } else if (input == "email") {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        let res = this.validEmail(this.formData[input]);
        res
          ? (this.inputs[`${input}Active`] = true)
          : (this.inputs[`${input}Active`] = false);
      } else {
        this.inputs[`${input}Active`] = false;
      }
    },
    submitForm() {
      let body = {
        replyTo: this.formData.email,
        subject: `New Contact - ${this.formData.firstname} ${this.formData.lastname}`,
        body: `Name: ${this.formData.firstname} ${this.formData.lastname}<br><br>Email: ${this.formData.email}<br><br>Message: ${this.formData.message}`
      };
      fetch(
        "https://ox3l8mqk6l.execute-api.ap-south-1.amazonaws.com/api/sendmail",
        {
          method: "POST",
          body: JSON.stringify(body),
          headers: {
            "Access-Control-Allow-Origin": "*"
          }
        }
      )
        .then(res => {
          return res.json();
        })
        .then(response => {
          if (response.statusCode == 200) {
            this.formData = {
              firstname: "",
              lastname: "",
              email: "",
              message: ""
            };
          }
        });
    }
  },
  watch: {
    "formData.email"(data) {
      let res = this.validEmail(data);
      this.emailValid = res;
    }
  }
};
</script>
