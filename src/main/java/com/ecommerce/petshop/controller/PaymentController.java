package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.config.PaypalPaymentIntent;
import com.ecommerce.petshop.config.PaypalPaymentMethod;
import com.ecommerce.petshop.customException.NotEnoughProductQuantityException;
import com.ecommerce.petshop.service.implementation.PaypalService;
import com.ecommerce.petshop.util.Utils;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PaymentController {
    public static final String URL_PAYPAL_SUCCESS = "pay/success";
    public static final String URL_PAYPAL_CANCEL = "pay/cancel";

    @Autowired
    private PaypalService paypalService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/pay")
    public ResponseEntity pay(HttpServletRequest request, @RequestParam("price") double price,@RequestParam("cId") int cartId) {
        String cancelUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_CANCEL;
        String successUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_SUCCESS;
        try {
            Payment payment = paypalService.createPayment(
                    price,
                    cartId,
                    "USD",

                    PaypalPaymentMethod.paypal,
                    PaypalPaymentIntent.sale,
                    "payment description",
                    cancelUrl,
                    successUrl);
            for (Links links : payment.getLinks()) {
                if (links.getRel().equals("approval_url")) {
                    return new ResponseEntity(links.getHref().toString(), HttpStatus.OK);
                }
            }
        } catch (PayPalRESTException e) {

        }
        return new ResponseEntity(HttpStatus.NOT_FOUND);
    }

    @GetMapping(URL_PAYPAL_CANCEL)
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping(URL_PAYPAL_SUCCESS+"/{cartId}")
    public RedirectView successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, @PathVariable("cartId") int cartId) {
        RedirectView redirectView = new RedirectView();
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId,cartId);
            if (payment.getState().equals("approved")) {
                redirectView.setUrl("http://localhost:3000/SuccessCheckOut");
                return redirectView;
            }
            else{
                redirectView.setUrl("http://localhost:3000/failCheckOut");
                return redirectView;
            }
        } catch (PayPalRESTException e) {
            redirectView.setUrl("http://localhost:3000/failCheckOut");
            return redirectView;
        } catch (NotEnoughProductQuantityException e) {
           int pId = Integer.parseInt(e.getMessage());
            redirectView.setUrl("http://localhost:3000/notEnough/"+pId);
            return redirectView;
        }

    }
}
