//
//  HomeLoansView.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI

struct HomeLoansView: View {
    var body: some View {
        VStack {
            Text("Home Loans")
                .font(.system(size: 18, weight: .bold))
                .padding(.top, 20)
            
            VStack(alignment: .leading) {
                Text("Know your BuyAbility℠")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top, 10)

                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(.blue)
                        Text("Zillow Home Loans")
                            .font(.system(size: 18, weight: .bold))
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("$ --")
                                .font(.title2)
                                .bold()
                            Text("Suggested target price")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("$ --")
                                .font(.title2)
                                .bold()
                            Text("BuyAbility℠")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("$ --")
                                .font(.title2)
                                .bold()
                            Text("Mo. payment")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("-- %")
                                .font(.title2)
                                .bold()
                            Text("Today's rate")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("-- %")
                                .font(.title2)
                                .bold()
                            Text("APR")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Button(action: {
                        // Action for button
                    }) {
                        Text("Let's get started")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Text("Zillow Home Loans is an equal housing lender. NMLS #10287")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding()
            }
            .background(Color.myGreen)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Explore more")
                    .font(.title2)
                    .bold()
                
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.green)
                        .font(.title)
                    VStack(alignment: .leading) {
                        Text("Get pre-qualified for a home loan")
                            .font(.headline)
                        Text("At Zillow Home Loans, we can pre-qualify you in less than three minutes with no impact on your credit score.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .padding()
            
            Spacer()
            
        }
        .background(Color(.systemGray6))
        .toolbar {
            ToolbarItem(placement:.principal){
                Text("Home Loans").bold()
            }
        }
    }
}



struct HomeLoansView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLoansView()
    }
}

