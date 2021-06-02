<template>
  <b-list-group class="text-center">
    <!-- Title -->
    <b-list-group-item variant="info"> Frequency Table </b-list-group-item>
    <!-- Header -->
    <b-list-group-item variant="success">
      <b-row cols="12">
        <b-col cols="3" class="border-right">Key</b-col>
        <b-col cols="3">Value</b-col>
        <b-col cols="3" class="border-left">Percentage</b-col>
      </b-row>
    </b-list-group-item>
    <!-- Content -->
    <b-list-group-item v-for="el in data" :key="el.key">
      <b-row cols="12">
        <b-col cols="3" class="border-right">{{ el.key }}</b-col>
        <b-col cols="3">{{ el.value }}</b-col>
        <b-col cols="3" class="border-left"
          >{{ calculatePercentage(el.value) }} %
        </b-col>
      </b-row>
    </b-list-group-item>
  </b-list-group>
</template>

<script>
export default {
  name: 'FrequencyTable',
  props: {
    data: {
      type: Array,
      default() {
        return []
      },
    },
  },
  methods: {
    calculatePercentage(value) {
      let total = 0
      this.data.forEach(({ value }) => {
        total += value
      })
      return parseFloat((value / total) * 100).toFixed(2)
    },
  },
}
</script>
