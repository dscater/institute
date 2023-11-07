<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Panel de Administración</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2" v-if="user.tipo == 'ESTUDIANTE'">
                    <div class="col-md-12">
                        <img
                            width="100%"
                            :src="url_principal + '/imgs/inicio_estudiante.jpg'"
                            alt=""
                        />
                    </div>
                </div>
                <div class="row">
                    <div
                        class="col-12"
                        :class="item.col ? item.col : 'col-sm-6 col-md-6'"
                        v-for="(item, index) in listInfoBox"
                        :key="index"
                    >
                        <div class="small-box" :class="item.color">
                            <div class="informacion">
                                <div class="inner">
                                    <h3>{{ item.cantidad }}</h3>
                                    <p class="text-xl">{{ item.label }}</p>
                                </div>
                                <div class="icon">
                                    <img :src="item.icon" />
                                </div>
                            </div>
                            <router-link
                                :to="{ name: item.url }"
                                class="small-box-footer bg-success"
                                >Ver más
                                <i class="fas fa-arrow-circle-right"></i
                            ></router-link>
                        </div>
                    </div>
                </div>
                <div class="row" v-if="configuracion">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h2
                                    style="
                                        font-weight: bold;
                                        text-align: center;
                                    "
                                >
                                    {{ configuracion.nombre_sistema }}
                                </h2>
                                <h3 style="text-align: center">
                                    ¡BIENVENID@ {{ user.full_name }}!
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            usuarios: 10,
            configuracion: JSON.parse(localStorage.getItem("configuracion")),
            user: JSON.parse(localStorage.getItem("user")),
            listInfoBox: [],
            htmlMision: "",
            htmlVision: "",
            htmlObjetivos: "",
            url_principal: main_url,
        };
    },
    mounted() {
        console.log(this.user);
        this.loadingWindow.close();
        this.getInfoBox();
    },
    methods: {
        getInfoBox() {
            axios.get(main_url + "/admin/usuarios/getInfoBox").then((res) => {
                this.listInfoBox = res.data;
            });
        },
    },
};
</script>

<style></style>
