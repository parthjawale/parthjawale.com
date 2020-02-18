<template>
  <div
    class="contact-me px-2-desktop px-1-mobile pt-5 pb-5-desktop pb-5-mobile b-primary"
  >
    <div class="heading wow fadeIn" data-wow-delay="0.5s">
      <h1 class="heading-super font-primary">Contact Me</h1>
      <h6>
        or mail me at
        <a onclick="window.location='mailto:hello@parthjawale.com'"
          >hello@parthjawale.com</a
        >
      </h6>
    </div>
    <form @submit.prevent="submitForm" ref="contactForm">
      <div class="inputs pb-2">
        <div class="input-group wow fadeInUp" data-wow-delay="0.7s">
          <label
            for="Name"
            :class="[
              'text-common font-secondary',
              'input-label',
              { active: inputs.firstnameActive }
            ]"
            >First Name</label
          >
          <input
            autocomplete="off"
            class="text-common font-secondary"
            type="text"
            v-model="formData.firstname"
            placeholder="What's your first name?"
            @input="inputChanged('firstname')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="0.9s">
          <label
            for="Name"
            :class="[
              'text-common font-secondary',
              'input-label',
              { active: inputs.lastnameActive }
            ]"
            >Last Name</label
          >
          <input
            autocomplete="off"
            class="text-common font-secondary"
            type="text"
            v-model="formData.lastname"
            placeholder="What's your last name?"
            @input="inputChanged('lastname')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="1.1s">
          <label
            for="Name"
            :class="[
              'text-common font-secondary',
              'input-label',
              { active: inputs.emailActive },
              { invalid: !emailValid && formData.email != '' }
            ]"
          >
            Email Address
            <i
              :class="[
                'fas',
                'fa-exclamation-circle',
                { invalid: !emailValid && formData.email != '' }
              ]"
            ></i>
          </label>
          <input
            autocomplete="off"
            :class="[
              'text-common font-secondary',
              { invalid: !emailValid && formData.email != '' }
            ]"
            type="text"
            v-model="formData.email"
            placeholder="What's your email address?"
            @input="inputChanged('email')"
          />
        </div>
        <div class="input-group wow fadeInUp" data-wow-delay="1.3s">
          <label
            for="Name"
            :class="[
              'text-common font-secondary',
              'input-label',
              { active: inputs.messageActive }
            ]"
            >Message</label
          >
          <textarea
            autocomplete="off"
            class="text-common font-secondary"
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
        id="contactFormButton"
        :class="submitButtonClass"
        data-wow-delay="0.3s"
      >
        <svg>
          <rect />
        </svg>
        Send
      </button>
    </form>
    <br />
    <transition name="fade">
      <span v-if="mailSent" class="text-common font-secondary contact-message"
        >You've sucessfully contacted me.</span
      >
    </transition>
    <div
      class="text-common font-secondary email pt-2 wow fadeInUp"
      data-wow-delay="0.5s"
    >
      <a onclick="window.location='mailto:hello@parthjawale.com'">
        <span class="email-text">I prefer good old-fashioned email.</span>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  created() {
    var _this = this;
  },
  data: () => ({
    formData: {
      firstname: "",
      lastname: "",
      email: "",
      message: "",
      buttonText: "Send"
    },
    apiKey: "ÞdÂHæÖaÛ¢~ó· =â¯Suj÷ø;8ð",
    loading: false,
    mailSent: false,
    submitButtonClass: "btn-svg font-primary wow fadeInUp pointer-none",
    inputs: {
      firstnameActive: false,
      lastnameActive: false,
      emailActive: false,
      messageActive: false
    },
    emailValid: true,
    formValid: false
  }),
  methods: {
    validEmail(email) {
      var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      let res = re.test(email.toLowerCase().trim());
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
      if (this.loading) return;
      this.submitButtonClass =
        "btn-svg font-primary wow fadeInUp pointer-none loading";
      let _this = this;
      let body = {
        firstname: this.formData.firstname,
        lastname: this.formData.lastname,
        replyTo: this.formData.email,
        subject: `New Contact - ${this.formData.firstname} ${this.formData.lastname}`,
        body: `Name: ${this.formData.firstname} ${this.formData.lastname}<br><br>Email: ${this.formData.email}<br><br>Message: ${this.formData.message}`
      };
      var myHeaders = new Headers();
      myHeaders.append("Content-Type", "application/json");
      myHeaders.append("x-api-key", btoa(_this.apiKey));
      // myHeaders.append("Origin", "https://parthjawa;");
      fetch(
        "https://ox3l8mqk6l.execute-api.ap-south-1.amazonaws.com/api/mailsender",
        {
          method: "POST",
          headers: myHeaders,
          body: JSON.stringify(body),
          redirect: "follow"
        }
      )
        .then(res => {
          return res.json();
        })
        .then(response => {
          if (response.statusCode == 200) {
            this.formData["firstname"] = "";
            this.formData["lastname"] = "";
            this.formData["email"] = "";
            this.formData["message"] = "";
            this.inputs["firstnameActive"] = false;
            this.inputs["lastnameActive"] = false;
            this.inputs["emailActive"] = false;
            this.inputs["messageActive"] = false;
            this.formValid = false;
            _this.submitButtonClass =
              "btn-svg font-primary wow fadeInUp pointer-none";
            _this.mailSent = true;
            setTimeout(() => {
              _this.mailSent = false;
            }, 1500);
          }
        });
    }
  },
  watch: {
    formData: {
      handler(val, newVal) {
        this.formValid = true;
        for (let i in newVal) {
          if (newVal[i] == "" || newVal[i] == null || newVal[i] == undefined) {
            this.formValid = false;
            this.submitButtonClass =
              "btn-svg font-primary wow fadeInUp pointer-none";
          }
          if (i == "email") {
            if (!this.validEmail(newVal[i])) {
              this.formValid = false;
              this.submitButtonClass =
                "btn-svg font-primary wow fadeInUp pointer-none";
            }
          }
        }
        if (this.formValid == true) {
          this.submitButtonClass = "btn-svg font-primary wow fadeInUp active";
        }
      },
      deep: true
    },
    "formData.email"(data) {
      let res = this.validEmail(data);
      this.emailValid = res;
    }
  }
};
</script>
