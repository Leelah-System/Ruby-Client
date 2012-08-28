showProducts = ->
  console.log(this)
  $('ul#tabs li:first a').trigger('click')
  ;
  return
  ;

class product
  constructor: (@name, @reference, @description, @price, @stock, @category_id) ->

class categoryViewModel
  constructor: (@parent) ->
    context = this
    @name = ko.observable('').extend({required: true})
    @label = ko.observable('').extend({required: true})
    @description = ko.observable('')
    @category = ko.computed(->
      {
      name: context.name(),
      label: context.label(),
      description: context.description()
      })

  reset: ->
    @name('')
    @label('')
    @description('')
    showProducts()
    return

class productViewModel
  constructor: (@parent) ->
    context = this
    @name = ko.observable('').extend({required: true})
    @reference = ko.observable('').extend({required: true})
    @description = ko.observable('')
    @price = ko.observable(0).extend({required: true})
    @stock = ko.observable(0)
    @category = ko.observable().extend({required: true})
    @product = () ->
      new product(
        context.name(),
      context.reference(),
      context.description(),
      context.price(),
      context.stock(),
      context.category().id)

  incrementStock: ->
    @stock(@stock() + 1)

  decrementStock: ->
    @stock(Math.max(@stock() - 1, 0))

  reset: ->
    @name('')
    @reference('')
    @description('')
    @price(0)
    @stock(0)
    @category(null)
    showProducts()
    return

class viewModel
  constructor: ->
    context = this
    @categories = ko.observableArray()
    @products = ko.observableArray([])
    @category = ko.observable()
    @product = ko.observable()
    @filteredProducts = ko.computed(->
      $.grep(context.products(), (item) ->
        context.category()? and item.category_id == context.category().id)
    )

    @categoryView = ko.validatedObservable(new categoryViewModel(this))
    @productView = ko.validatedObservable(new productViewModel(this))

    @active = (category) ->
      if context.category()? and category.id == context.category().id then "active" else ""
    @select = (category) ->
      context.category(category)
    @edit = (product) ->
      context.product(product)

  addProduct: (p) ->
    if p.parent.productView.isValid()
      newProduct = p.product()
      $.ajax({
      type: 'POST',
      url: '/product',
      contentType: 'application/json',
      dataType: 'json',
      data: JSON.stringify(newProduct),
      success: (data) ->
        p.parent.products.push(newProduct)
        p.reset()
        return
      error: (a, b, c) ->
        alert(c)
      })
    else
      p.parent.productView.errors.showAllMessages()
    return

  addCategory: (c) ->
    if c.parent.categoryView.isValid()
      c.parent.categoryView.errors.showAllMessages(false)
      newCategory = c.category()
      $.ajax({
      type: 'POST',
      url: '/category',
      contentType: 'application/json',
      dataType: 'json',
      data: JSON.stringify(newCategory),
      success: (data) ->
        c.parent.categories.push(newCategory)
        c.reset()
        return
      error: (a, b, c) ->
        alert(c)
      })
    else
      c.parent.categoryView.errors.showAllMessages()
    return

vm = new viewModel()
ko.applyBindings(vm)

$.ajax({
type: "GET",
url: "/categories",
contentType: "application/json",
success: (data) ->
  categories = data
  vm.categories(categories)
  vm.category(categories[0])
  return
})

$.ajax({
type: "GET",
url: "/products",
contentType: "application/json",
success: (data) ->
  vm.products(data)
  return
})
