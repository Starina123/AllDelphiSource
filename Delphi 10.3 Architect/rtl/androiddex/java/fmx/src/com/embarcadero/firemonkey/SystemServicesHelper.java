package com.embarcadero.firemonkey;

import android.content.Context;
import android.support.annotation.NonNull;

import java.util.Objects;

/**
 * Copyright(c) 2018 Embarcadero Technologies, Inc.
 */
public class SystemServicesHelper {

    /**
     * Requests from the Android specified system service {@code serviceName}.
     *
     * @param context      context of application.
     * @param serviceName  name of system service.
     * @param serviceClass class of system service.
     * @return instance of system service, if it was found and it was a specified class {@code serviceClass}.
     */
    @NonNull
    public static <Service> Service getServiceOrThrow(@NonNull Context context, @NonNull String serviceName,
                                                      @NonNull Class<Service> serviceClass) {
         Objects.requireNonNull(context, "context");
         Objects.requireNonNull(serviceName, "serviceName");
         Objects.requireNonNull(serviceClass, "serviceClass");

         Object service = context.getSystemService(serviceName);
         if (service == null) {
             throw new IllegalStateException(String.format("System service %s is not found.", serviceName));
         }
         if (!serviceClass.isInstance(service)) {
             throw new IllegalStateException(String.format("System service was found [%s], but it's from other class [%s].",
                     service.getClass().toString(), serviceClass.toString()));
         }
         return serviceClass.cast(service);
    }
}
