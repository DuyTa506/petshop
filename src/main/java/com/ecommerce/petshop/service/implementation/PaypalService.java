package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.config.PaypalPaymentIntent;
import com.ecommerce.petshop.config.PaypalPaymentMethod;
import com.ecommerce.petshop.customException.NotEnoughProductQuantityException;
import com.ecommerce.petshop.service.interfaces.CartService;
import com.ecommerce.petshop.service.interfaces.OrderService;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class PaypalService {
    @Autowired
    private APIContext apiContext;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;
    public Payment createPayment(
            Double total,
            int cartId,
            String currency,
            PaypalPaymentMethod method,
            PaypalPaymentIntent intent,
            String description,
            String cancelUrl,
            String successUrl) throws PayPalRESTException {
        Amount amount = new Amount();
        amount.setCurrency(currency);
        amount.setTotal(String.format("%.2f", total));
        Transaction transaction = new Transaction();
        transaction.setDescription(description);
        transaction.setAmount(amount);
        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);
        Payer payer = new Payer();
        payer.setPaymentMethod(method.toString());
        Payment payment = new Payment();
        payment.setIntent(intent.toString());
        payment.setPayer(payer);
        payment.setTransactions(transactions);
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelUrl);
        redirectUrls.setReturnUrl(successUrl+"/"+cartId);
        payment.setRedirectUrls(redirectUrls);

        apiContext.setMaskRequestId(true);
        return payment.create(apiContext);
    }


    @Transactional
    public Payment executePayment(String paymentId, String payerId,int cartId) throws PayPalRESTException, NotEnoughProductQuantityException {
        Payment payment = new Payment();
        payment.setId(paymentId);
        PaymentExecution paymentExecute = new PaymentExecution();
        paymentExecute.setPayerId(payerId);
        Payment result = payment.execute(apiContext, paymentExecute);
        cartService.checkOut(cartId);
        orderService.cartToOrder(cartId);
        if (!result.getState().equals("approved")) {
            throw new PayPalRESTException("Invalid payment");
        }
        return result;
    }
}
