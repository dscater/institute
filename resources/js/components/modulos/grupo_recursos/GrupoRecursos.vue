<template>
    <div class="col-md-12 mb-3 contenedor_link_recurso">
        <div class="row">
            <div
                class="col-md-12"
                v-if="listRecursos.length > 0"
                v-for="item in listRecursos"
            >
                <div class="card mb-1">
                    <div class="card-body">
                        <div class="row fila_recurso">
                            <span class="fecha_hora">{{ item.fecha_txt }}</span>
                            <div class="col-md-12">
                                {{ item.titulo }}
                            </div>
                            <div class="col-md-12">
                                <a :href="item.link" target="_blank">{{
                                    item.link
                                }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" v-if="listRecursos.length == 0">
                <div class="card">
                    <div class="card-body">
                        <h4 class="w-100 text-center font-weight-bold text-md">SIN RECURSOS AÚN</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        grupo_id: {
            type: Number,
            default: 0,
            requred: true,
        },
    },
    data() {
        return {
            listRecursos: [],
        };
    },
    mounted() {
        this.getRecursosGrupo();
    },
    methods: {
        getRecursosGrupo() {
            axios
                .get(
                    main_url +
                        "/admin/grupo_recursos/getRecursosGrupo/" +
                        this.grupo_id
                )
                .then((response) => {
                    this.listRecursos = response.data;
                    console.log(this.listRecursos);
                });
        },
    },
};
</script>
<style>
.contenedor_link_recurso .fila_recurso {
    position: relative;
}
.contenedor_link_recurso .fecha_hora {
    position: absolute;
    right: 0px;
    top: 0px;
    font-size: 0.75em;
}
</style>
