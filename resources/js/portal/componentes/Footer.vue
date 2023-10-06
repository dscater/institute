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
                    <a href=""
                        ><span class="lnr lnr-phone-handset"></span>
                        <span class="text">+591 63326803</span></a
                    >
                    <a href="" class="ml-3"
                        ><span class="lnr lnr-phone-handset"></span>
                        <span class="text">+591 64312163</span></a
                    >
                    <a href="mailto:info@tomorrowstoday.com" class="ml-3"
                        ><span class="lnr lnr-envelope"></span>
                        <span class="text">info@tomorrowstoday.com</span></a
                    >
                </div>

                <div class="col-lg-12 col-sm-12 footer-social text-center mb-5">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-dribbble"></i></a>
                    <a href="#"><i class="fab fa-behance"></i></a>
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
    props: ["logo", "empresa"],
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
