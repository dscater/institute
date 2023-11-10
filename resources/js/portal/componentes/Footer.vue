<template>
    <!-- start footer Area -->
    <footer class="footer-area section-gap pt-0 pb-5">
        <div class="container">
            <div
                class="footer-bottom row align-items-center justify-content-between"
            >
                <div
                    class="footer-text m-0 col-lg-12 col-md-12 text-center mb-2"
                >
                    <a
                        :href="
                            contacto.fono1
                                ? 'https://wa.me/' +
                                  contacto.fono1.replace(' ', '')
                                : ''
                        "
                        target="_blank"
                        ><span class="lnr lnr-phone-handset"></span>
                        <span class="text">{{ contacto.fono1 }}</span></a
                    >
                    <a
                        v-if="contacto.fono2 != ''"
                        :href="
                            contacto.fono2
                                ? 'https://wa.me/' +
                                  contacto.fono2?.replace(' ', '')
                                : ''
                        "
                        target="_blank"
                        class="ml-3"
                        ><span class="lnr lnr-phone-handset"></span>
                        <span class="text">{{ contacto.fono2 }}</span></a
                    >
                    <a :href="'mailto:' + contacto.correo" class="ml-3"
                        ><span class="lnr lnr-envelope"></span>
                        <span class="text">{{ contacto.correo }}</span></a
                    >
                </div>

                <div class="col-lg-12 col-sm-12 footer-social text-center mb-5">
                    <a :href="red_social.facebook" target="_blank"
                        ><i class="fab fa-facebook"></i
                    ></a>
                    <a :href="red_social.tiktok" target="_blank"
                        ><i class="fab fa-tiktok"></i
                    ></a>
                    <a :href="red_social.instagram" target="_blank"
                        ><i class="fab fa-instagram"></i
                    ></a>
                    <a :href="red_social.youtube" target="_blank"
                        ><i class="fab fa-youtube"></i
                    ></a>
                </div>
                <p class="footer-text m-0 col-lg-12 col-md-12 text-center">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    {{ getAnioActual() }}
                    Todos los derechos reservados
                </p>
                <p class="oculto">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    {{ getAnioActual() }}
                    All rights reserved | Made with
                    <i class="fa fa-heart-o" aria-hidden="true"></i> by
                    <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    &amp; distributed by
                    <a href="https://themewagon.com" target="_blank"
                        >ThemeWagon</a
                    >
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </footer>
    <!-- End footer Area -->
</template>
<script>
export default {
    props: ["logo", "empresa", "contacto", "red_social"],
    data() {
        return {
            oRedSocial: null,
        };
    },
    mounted() {
        this.getInfoRedSocial();
    },
    methods: {
        getInfoRedSocial() {
            axios.get(main_url + "/portal/getRedSocial").then((response) => {
                this.oRedSocial = response.data.red_social;
            });
        },
    },
};
</script>
