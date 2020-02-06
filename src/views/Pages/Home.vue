<template>
  <section id="home-page" class="full-page-desktop b-primary content-wrapper pb-5-mobile">
    <div class="about-me navbar-fix">
      <div class="about-me-text">
        <div class="main-heading-wrapper">
          <h2
            class="heading-super font-primary wow fadeInUp"
            data-wow-duration="0.9s"
            data-wow-delay="0.6s"
          >UI/UX, Backend Developer &amp; Cloud Enthusiast.</h2>
        </div>
        <div class="text-common font-secondary">
          <p class="wow fadeInUp" data-wow-duration="1.4s" data-wow-delay="1.2s">
            Hello, I'm Parth Jawale, a Final Year engineering student studying in Manipal University, Jaipur.
            I am a web developer with extensive experience, obsessed with transforming the digital space into a more easily accessible and alluring hangout.
            <br />
            <br /> Currently interning at <a class="text-link-wrapper" href="https://logmeininc.com" target="_blank">
              <span class="text-link">LogMeIn Inc.</span>
            </a>
            <br />Co-Founder at
            <a class="text-link-wrapper" href="https://mext.in" target="_blank">
              <span class="text-link">Mext</span>
            </a>,
            <span class="tooltip" data-popup="June '18 - March '19">
              <span class="strikethrough">
                <span class="previous-role">
                Previously Technical Lead at
                <a
                  href="https://gramiksha.in"
                  class="text-link-wrapper"
                  target="blank"
                >
                  <span class="text-link">Gramiksha</span>
                </a>.
                </span>
              </span>
            </span>
            <br />
            <br />
            <router-link tag="a" class="text-link-wrapper" to="/about">
              <span class="text-link">Get acquainted</span>
            </router-link>&nbsp;&nbsp;with me, or head
            <router-link class="text-link-wrapper" tag="a" to="/work">
              <span class="text-link">over here</span>
            </router-link>&nbsp;&nbsp;for a glimpse of my work.
            <br />
            <br />Here's a
            <a class="text-link-wrapper" href="http://tiny.cc/0ry1az" target="_blank">
              <span class="text-link">link</span>
            </a>
            to my resume.
          </p>
        </div>
      </div>
      <div class="about-me-image wow fadeIn" data-wow-duration="1.4s" data-wow-delay="2.3s">
        <img src="@/assets/self.jpg" alt />
      </div>
    </div>
  </section>
</template>
