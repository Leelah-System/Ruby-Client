class order
  constructor: (@amount, @created_at, @id, @reference, @status, @updated_at, @user_id, @status_to_string) ->

class viewModel
  constructor: ->
    context = this
    @orders = ko.observableArray()
    @order = ko.observable()

#    @orderView = ko.validatedObservable(new orderViewModel(this))

vm = new viewModel()
ko.applyBindings(vm)


$.ajax({
type: "GET",
url: "/orders",
contentType: "application/json",
success: (data) ->
  vm.orders(data)
  return
})
