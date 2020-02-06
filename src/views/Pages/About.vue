<template>
  <div class="about-page b-primary pb-5-desktop pb-5-mobile px-2-mobile pt-5">
    <transition name="fade">
      <div
        class="scroll-progress"
        :style="`transform: scaleX(${scaleX})`"
        v-if="!scrollProgressHide"
      ></div>
    </transition>
    <div class="about-wrapper">
      <div class="name wow fadeInUp" data-wow-delay="0.5s">
        <h1 class="heading-super font-primary">
          Hello, I'm
          <span>Parth Jawale.</span>
        </h1>
      </div>
      <div class="about-me-text text-common font-secondary wow fadeIn" data-wow-delay="1.2s">
        <p>I'm a full-stack web developer, inclined towards the backend and cloud services.</p>
        <article>TL;DR: An effectual UI/UX beautifies and streamlines things, creating something equal parts easy and fun to use. My eternal goal is creating that something.</article>
        <p>
          My earliest memories of using a computer date back to when I was 6 years old, playing Road Rash on a Pentium 4 processor.
          I've always since been fascinated by computers.
        </p>
        <p>I was 11 when I created my first webpage. It was a simple white-background page with a marquee tag and a million haphazardly placed paragraphs and heading tags. I built it, proudly, on the most advanced text editor of the time - The Windows Notepad.</p>
        <p>
          In retrospect, looking back at my first website would probably give me
          <a
            class="text-link-wrapper"
            @mouseenter="cancer=true"
            @mouseleave="cancer=false"
            @click="setGif('cancer')"
          >
            <span class="text-link">cancer</span>
          </a>. Although, the fire of fascination and experimentation that arose in me then is still burning in its full glory.
        </p>
        <p>My interest in this field grew even more when I got to high school. Friends &amp; family always approached me with computer issues because they knew that I loved solving problems — especially problems that had to do with technology.</p>
        <p>
          <em>The fact that there are limitless possibilities to the type of applications which can be fabricated as well as the robust nature of programming languages is what at first allured me to the world of programming.</em>
        </p>
        <p>
          I was first properly introduced to a programming language - Java, when I was 15. Its intricate syntax and concepts got to me and I really enjoyed experimenting with them. I used to stay up whole nights, learning new stuff, most of it from the legendary Bucky -
          <a
            href="https://www.youtube.com/user/thenewboston"
            class="text-link-wrapper"
            target="_blank"
          >
            <span class="text-link">TheNewBoston</span> <i class="fas fa-external-link-alt fa-1x" style="font-size:1.2rem;"></i>
          </a> (not Captain America's
          <a
            class="text-link-wrapper"
            @mouseenter="bestFriend=true"
            @mouseleave="bestFriend=false"
            @click="setGif('bestFriend')"
          >
            <span class="text-link">best friend</span>
          </a> or Iron Man's
          <a
            class="text-link-wrapper"
            @mouseenter="ironMan=true"
            @mouseleave="ironMan=false"
            @click="setGif('ironMan')"
          >
            <span class="text-link">*spoiler alert*</span>
          </a>)
        </p>
        <p>I quicky progressed to C, C++ and my old friend - HTML. Moving forward to CSS, I started working projects. I learnt Javascript, applying it on the various (not always successful) experiments that I conducted with CSS. All this while, also learning a little bit of Microprocessor &mu;P8085.</p>
        <p>College is where I polished my existing knowledge. I worked on the front-end and soon progressed to back-end where I found my passion. The backend, which determines the reliability of a system, its efficiency as well as its response time, appealed to me and I was found constantly learning new technologies, continually trying out new strategies to improve all these subtle aspects of a system. I was also introduced to the seemingly boundless world of Cloud Computing.</p>
        <p>
          <em>I am drawn to the philosophy of guaranteeing users the best User Experience (UX), one which holistically expresses the product or service in an easy to use manner, all the while assuring a fluid and sophisticated User Interface (UI).</em>
        </p>
        <p>Amazon Web Services (AWS) has been my abode for the majority of the past two years. From dispatching a virtual machine (EC2) or deploying web apps (Elastic Beanstalk) to using DynamoDB, I've experimented profusely in my projects, with AWS never letting me down.</p>
        <p>
          <b>P.S:</b> I'm a final year Bachelor of Technology (B.Tech) student at
          <br />
          <a href="https://jaipur.manipal.edu" target="_blank" class="text-link-wrapper">
            <span class="text-link">Manipal University Jaipur</span> <i class="fas fa-external-link-alt fa-1x" style="font-size:1.2rem;"></i>
          </a>, majoring in Computer Science.
        </p>
        <p>
          I'm currently interning at <a href="https://logmeininc.com" target="_blank" class="text-link-wrapper">
            <span class="text-link">LogMeIn Inc.</span> <i class="fas fa-external-link-alt fa-1x" style="font-size:1.2rem;"></i>
          </a> in Bangalore.
          <br>
          Nowadays, one can find me exploring Bangalore and trying to learn Kannada (unsuccessfully).
        </p>
        <p>
          <b class="heading">Skills</b>
          <br />
          <b>Development</b>
          <br />- Front End: HTML, CSS, JavaScript, SASS, SCSS
          <br />- Back End: PHP, NodeJS
          <br />- Libraries &amp; Frameworks: Bootstrap, VueJS, Vuetify, Vuex, Vuefire
          <br />- Databases: Firebase, MySQL, MongoDB
          <br />- DNS Management
          <br />- Docker
          <br />- Flutter
          <br />- Unity
          <br />
          <b>Server Administration</b>
          <br />- Apache
          <br />- NodeJS
          <br />
          <b>Cloud Computing</b>
          <br />- Amazon Web Services (AWS) : EC2, Route 53, DynamoDB, S3, Elastic Beanstalk (EBS), AWS Lambda
          <br />
          <b>Adobe Photoshop</b>
          <br />
          <b>Programming Languages</b>
          <br />- C
          <br />- C++
          <br />- Python
          <br />- Java
        </p>
      </div>
      <div class="gif-viewer" :style="gifStyle">
        <iframe
          v-show="cancer"
          src="https://giphy.com/embed/3og0IU2CCxcCsu0bgk"
          :width="gifWidth"
          frameborder="0"
          class="giphy-embed"
          allowfullscreen
        ></iframe>
        <iframe
          v-show="bestFriend"
          src="https://giphy.com/embed/l0GtvIFAkD8KsNkfm"
          :width="gifWidth"
          frameborder="0"
          class="giphy-embed"
          allowfullscreen
        ></iframe>
        <iframe
          v-show="ironMan"
          src="https://giphy.com/embed/kC4EZJGbvlXpu"
          :width="gifWidth"
          frameborder="0"
          class="giphy-embed"
          allowfullscreen
        ></iframe>
      </div>
      <div class="further">
        <div class="further-work">
          <h1 class="heading-super font-quad">
            Looking for my work?
            <br />
            <h4>Hope you like it!</h4>
            <router-link class="font-secondary" tag="button" to="/work">See Work</router-link>
          </h1>
        </div>
        <div class="further-contact">
          <h1 class="heading-super font-quad">
            Want to hire me or work with me?
            <br />
            <h4>or have a really cool suggestion for a novel?</h4>
            <router-link tag="button" class="font-secondary" to="/contact">Contact Me</router-link>
          </h1>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { bus } from "@/main";
let scrollFunc = _this => {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height =
    document.documentElement.scrollHeight -
    document.documentElement.clientHeight;
  var scrolled = winScroll / height;
  if (screen.width > 768) {
    if (winScroll / height >= 0.99) {
      _this.scrollProgressHide = true;
      bus.$emit("hideNavbarAndFooter");
    } else {
      _this.scrollProgressHide = false;
      bus.$emit("showNavbarAndFooter");
    }
  } else {
    if (winScroll / height >= 0.95) {
      _this.scrollProgressHide = true;
      bus.$emit("hideNavbarAndFooter");
    } else {
      _this.scrollProgressHide = false;
      bus.$emit("showNavbarAndFooter");
    }
  }
  _this.scaleX = scrolled;
};

export default {
  data: () => ({
    clientX: -500,
    clientY: -500,
    cancer: false,
    bestFriend: false,
    ironMan: false,
    gifStyle: "top:-500px;left:-500px",
    gifWidth: 360,
    scaleX: 0,
    scrollProgressHide: false
  }),
  mounted() {
    this.gifDivMover();
    this.scroller();
  },
  methods: {
    gifDivMover() {
      let _this = this;
      window.addEventListener("mousemove", e => {
        if (screen.width > 768) {
          _this.gifStyle = `top:${e.pageY}px;left:${e.pageX}px`;
        } else {
          _this.gifStyle = `top:${e.pageY}px;left:50%`;
          _this.gifWidth = 300;
        }
      });
    },
    scroller() {
      let _this = this;
      window.addEventListener("scroll", scrollFunc, true);
    },
    setGif(gif) {
      let _this = this;
      if (screen.width <= 768) {
        if (gif == "cancer") _this.cancer = true;
        if (gif == "bestFriend") _this.bestFriend = true;
        if (gif == "ironMan") _this.ironMan = true;
      }
    }
  },
  beforeDestroy() {
    window.removeEventListener("scroll", scrollFunc, false);
  }
};
</script>