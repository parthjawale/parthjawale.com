<template>
  <div class="contact-me px-2 pt-5 pb-5">
    <div class="heading">
      <h1 class="heading-super font-secondary wow fadeIn" data-wow-delay="0.5s">Contact Me</h1>
    </div>
    <form>
      <div class="inputs pb-2">
        <div class="input-group wow fadeInUp" data-wow-delay="0.7s">
          <label
            for="Name"
            :class="['text-common' ,'input-label', {active: inputs.firstnameActive}]"
          >First Name</label>
          <input
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
            type="text"
            v-model="formData.lastname"
            placeholder="What's your last name?"
            @input="inputChanged('lastname')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="1.1s">
          <label
            for="Name"
            :class="['text-common' ,'input-label', {active: inputs.emailActive}]"
          >Email Address</label>
          <input
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
            type="text"
            rows="1"
            v-model="formData.message"
            placeholder="What's do you want to tell me?"
            @input="inputChanged('message')"
          />
        </div>
      </div>
      <button
        type="submit"
        :class="['btn-large', 'font-primary', 'wow', 'fadeInUp',{active:formValid}]"
        :disabled="!formValid"
        data-wow-delay="1.6s"
      >Send</button>
    </form>
    <div class="text-common email pt-2 wow fadeInUp">
      <a>
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
    }
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
          if (!this.validEmail(i)) return false;
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
    }
  },
  watch: {
    inputs: data => {
      //execute your code here
      console.log(data);
    },
    deep: true
  }
};
</script>
