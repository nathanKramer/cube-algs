const initializeForm = (formSelector, data) => {
  const form = document.querySelector(formSelector)

  for (const [key, value] of Object.entries(data)) {
    let input = form.querySelector(`input[name="algorithm[${camelToSnake(key)}]"]`)
    input.value = value
  }
}

function lowercaseFirstLetter(string) {
  return string.charAt(0).toLowerCase() + string.slice(1);
}

function getFormValues(dataAttributes) {
  const keys = Object.keys(dataAttributes).filter(v => {
    return v.startsWith('formValue')
  })

  let data = {}
  keys.forEach(v => {
    let key = lowercaseFirstLetter(v.replace('formValue', ''))
    data[key] = dataAttributes[v]
  })

  return data
}

function camelToSnake(string) {
  return string.replace(/([a-z])([A-Z])/g, '$1_$2').toLowerCase()
}

$(document).ready(() => {
  $('.add-algorithm').on('click', (el) => {
    const button = $(el.currentTarget)
    const formSelector = button.data('form-target')

    const dataAttributes = button.data()
    initializeForm(formSelector, getFormValues(dataAttributes))
  })
})
