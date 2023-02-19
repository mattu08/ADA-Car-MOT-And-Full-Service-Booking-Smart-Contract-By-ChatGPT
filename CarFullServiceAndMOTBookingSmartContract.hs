-- Define a car service and MOT booking smart contract.

smart contract CarBooking
  record Booking =
    { serviceName: String;
      servicePrice: Ada; }

  record CarBooking =
    { service: Booking;
      mot: Booking; }

  -- Define the available service and MOT options.
  entrypoint getServiceOptions(): Booking is
    return {serviceName: "Full Service", servicePrice: 170};
  end getServiceOptions;

  entrypoint getMOTOptions(): Booking is
    return {serviceName: "MOT", servicePrice: 50};
  end getMOTOptions;

  -- Define a function to book a car for both service and MOT.
  entrypoint bookCarServiceAndMOT(): Bool is
    let serviceOption = getServiceOptions();
    let motOption = getMOTOptions();
    let bookingPrice = serviceOption.servicePrice + motOption.servicePrice;
    require(tx.value >= bookingPrice, "Insufficient funds to book the service and MOT.");
    return True;
  end bookCarServiceAndMOT;
end CarBooking;
