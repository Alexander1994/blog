<style lang="less" scoped>
    @import "../../less/vars";

    // general about styles
    #about {
        height: 100vh;
        background: @black;
        color: @white;
    }
    @media (@xxSmallQuery) {
        #about {
            height: 100%;
        }
    }

    .section {
        height: auto;

        &:first-child > .columns {
            margin-top: 3.5em;
        }
    }

    // ring
    @img-size: 120px;
    @diameter: 3em;
    .ring {
        border: 2px solid @white;
        border-radius: 50%;
        font-size: 5em;
        height: @diameter;
        width: @diameter;
        margin: 0 auto;
        line-height: @diameter;
        text-align: center;

        & img {
            margin-top: calc(@diameter/2 ~" - " @img-size/2);
            opacity: 0.85;
        }
        & img:hover {
            opacity: 0.463;
        }
    }

    @media (@mediumQuery) {
        .ring {
            @query-diameter: @diameter * 0.8;
            font-size: 3.75em;
            height: @query-diameter;
            width: @query-diameter;
            line-height: @query-diameter;

            & img {
                margin-top: calc(@query-diameter/2 ~" - " @img-size/2);
            }
        }
    }

    @media (@xSmallQuery) {
        .ring {
            @query-diameter: @diameter * 0.65;
            font-size: 2.5em;
            height: @query-diameter;
            width: @query-diameter;
            line-height: @query-diameter;

            & img {
                margin-top: calc(@query-diameter/2 ~" - " @img-size/4);
                height: @img-size * 0.5;
                width: @img-size * 0.5;
            }
        }
        .link-section > .columns {
            width: 33%;
        }
        .container {
            padding: 0 10px;
        }
        .about-me-info > p:last-child {
            display: none;
        }
    }

    a.white {
        color: @white;
        text-decoration: none;
    }

    a.white:hover {
        color: @grey;
    }

    .linkedin {
        width: @img-size;
        height: @img-size;
    }

    // about me text
    .about-me-info > p {
        margin-bottom: 0.5rem;
        line-height:1.4em;

        &:last-child {
            margin-bottom: 0rem;
            text-align: center;
        }
    }

    // decals
    .decal-container {
        position: relative;
        margin-top: 1.5em;

        & > .about-me-info {
            margin: 1.5em;
        }
    }
    @media (max-height: 570px) {
        .decal-container > .about-me-info {
            margin: 1em;
        }
    }
    @media (max-height: 570px) {
        .decal-container {
            margin-top: 1rem;
        }
    }
    .left-decal, .right-decal {
        position: absolute;
        width: 3em;
        height: 3em;
    }
    .left-decal {
        border-top: 2px solid @white;
        border-left: 2px solid @white;
    }
    .right-decal {
        border-right: 2px solid @white;
        border-bottom: 2px solid @white;
        right: 0;
        bottom: 0;
    }
</style>

<template>
    <section id="about">
        <arrow down="false" black="false" scroll-to="app"></arrow>
        <div class="container">
            <div class="row section link-section">
                <div class="four columns">
                    <a class="white" href="media/resume.pdf" target="_blank">
                        <div class="resume ring">CV</div>
                    </a>
                </div>
                <div class="four columns u-pull-right">
                    <div class="ring">
                        <a href="https://www.linkedin.com/in/alex-mccallum-341949149/">
                            <img class="linkedin" src="media/linkedin.png" alt="LinkedIn">
                        </a>
                    </div>
                </div>
                <div class="four columns u-pull-right">
                    <div class="ring">
                        <a href="https://github.com/Alexander1994">
                            <img src="media/GitHub-Mark-Light-120px-plus.png" alt="Github">
                        </a>
                    </div>
                </div>
            </div>
            <div class="row section">
                <div class="twelve columns decal-container">
                    <div class="left-decal"></div>
                        <div class="about-me-info">
                            <p>
                                My name is Alex McCallum, I am software developer from Halifax, Nova Scotia.
                                I recently graduated from Dalhousie University with a bachelors degree in science with a major in computer science.
                                I am very passionate about software development and curious about all aspects of computer science.
                           </p>
                            <p>
                                At Dalhousie I enjoyed a wide variety of events put on by Dalhousie societies.
                                I regularly attended game jams and hackathons put on by the Dalhousie CS society.
                                I held a position on Dal's Super Smash Brothers Society, a video game society where players gather to play the game competitively.
                                I enjoy improv acting through Dalhousie's improv society.
                                Beyond School and work, I enjoy the gym, yoga, playing guitar and reading.
                            </p>
                            <p>
                                More in depth info about my career me can be found in the links above.
                            </p>
                        </div>

                    <div class="right-decal"></div>
                </div>
            </div>
        </div>
        <arrow down="true" black="false" scroll-to="projects"></arrow>
    </section>
</template>

<script>
    const Arrow = require("./arrow.vue");

    module.exports = {
        name: 'about',
        components: {Arrow}
    };
</script>