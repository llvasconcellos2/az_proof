import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/dashboard_model.dart';
import 'az_api.dart';

class DashboardProvider {
  final AzApi api = AzApi();

  RxString get error => api.error;

  Future<DashboardModel> getAll() async {
    try {
      final response = await api.request.get(
        '${api.baseUrl}/dashboard',
      );
      return DashboardModel.fromJson(response.data);
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(e);
        print(e.runtimeType);
        print(stacktrace);
      }
      //return DashboardModel();

      return DashboardModel(
        ordersTotal: 1020.00,
        ordersCount: 33,
        salesTotal: 2040.00,
        salesCount: 66,
        averageTicket: 365.00,
        orders: <Order>[
          Order(
            customer: Customer(
              name: "Foo Enterprises LTD",
              doc: "001.123145/0001-88",
              email: "foo@foo.com",
              phone: "+55 23 32455598",
            ),
            coupon: Coupon(
              id: "0001",
              code: 'COUPON123',
              name: 'Black Friday',
              discount: 10.00,
              type: 'Discount Type',
              application: 'application',
            ),
            seller: Seller(
              id: '1',
              name: 'Leonardo',
              email: 'leonardolimadevasconcellos@gmail.com',
            ),
            payment: Payment(
              discount: 10,
              amount: 1020,
              date: DateTime.now(),
              installments: 1,
              method: 'CC',
              originalAmount: 1020,
              status: 'done',
              transactionId: '11',
            ),
            createdAt: DateTime.now(),
            delivery: Delivery(
              history: [],
              address: Address(
                line1: 'Rua sem nome, sn',
                neighborhood: 'Areias',
                city: 'Camboriú',
                countryCode: 'BR',
                postalCode: '88000',
                state: 'SC',
              ),
            ),
            products: [],
            sId: '0E14Q45D',
            status: 'done',
            invoices: [],
            orderSellerId: '1',
            updatedAt: DateTime.now(),
            partner: null,
            refund: null,
            replacementProduct: null,
            userId: '1',
          ),
          Order(
            customer: Customer(
              name: "Foo Enterprises LTD",
              doc: "001.123145/0001-88",
              email: "foo@foo.com",
              phone: "+55 23 32455598",
            ),
            coupon: Coupon(
              id: "0001",
              code: 'COUPON123',
              name: 'Black Friday',
              discount: 10.00,
              type: 'Discount Type',
              application: 'application',
            ),
            seller: Seller(
              id: '1',
              name: 'Leonardo',
              email: 'leonardolimadevasconcellos@gmail.com',
            ),
            payment: Payment(
              discount: 10,
              amount: 1020,
              date: DateTime.now(),
              installments: 1,
              method: 'CC',
              originalAmount: 1020,
              status: 'done',
              transactionId: '11',
            ),
            createdAt: DateTime.now(),
            delivery: Delivery(
              history: [],
              address: Address(
                line1: 'Rua sem nome, sn',
                neighborhood: 'Areias',
                city: 'Camboriú',
                countryCode: 'BR',
                postalCode: '88000',
                state: 'SC',
              ),
            ),
            products: [],
            sId: '0E14Q45D',
            status: 'done',
            invoices: [],
            orderSellerId: '1',
            updatedAt: DateTime.now(),
            partner: null,
            refund: null,
            replacementProduct: null,
            userId: '1',
          ),
          Order(
            customer: Customer(
              name: "Foo Enterprises LTD",
              doc: "001.123145/0001-88",
              email: "foo@foo.com",
              phone: "+55 23 32455598",
            ),
            coupon: Coupon(
              id: "0001",
              code: 'COUPON123',
              name: 'Black Friday',
              discount: 10.00,
              type: 'Discount Type',
              application: 'application',
            ),
            seller: Seller(
              id: '1',
              name: 'Leonardo',
              email: 'leonardolimadevasconcellos@gmail.com',
            ),
            payment: Payment(
              discount: 10,
              amount: 1020,
              date: DateTime.now(),
              installments: 1,
              method: 'CC',
              originalAmount: 1020,
              status: 'done',
              transactionId: '11',
            ),
            createdAt: DateTime.now(),
            delivery: Delivery(
              history: [],
              address: Address(
                line1: 'Rua sem nome, sn',
                neighborhood: 'Areias',
                city: 'Camboriú',
                countryCode: 'BR',
                postalCode: '88000',
                state: 'SC',
              ),
            ),
            products: [],
            sId: '0E14Q45D',
            status: 'done',
            invoices: [],
            orderSellerId: '1',
            updatedAt: DateTime.now(),
            partner: null,
            refund: null,
            replacementProduct: null,
            userId: '1',
          ),
        ],
        hasMore: false,
        limit: 100,
        totalPages: 1,
        page: 1,
        total: 10,
      );
    }
  }
}
