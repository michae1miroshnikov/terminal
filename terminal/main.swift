//
//  main.swift
//  terminal
//
//  Created by Michael Miroshnikov on 27/11/2024.
//

import Foundation

class BankTerminal {
    private var cupureCounts: [Int: Int] = [:]
    private let validCupures = [5, 10, 20, 50, 100]

    func processDeposit() {
        print("Hello, Welcome to our Bank Terminal!\n")

        repeat {
            print("Please enter the total number of cupures:")

            if let input = readLine(), let totalCupures = Int(input), totalCupures > 0 {
                print("You entered \(totalCupures) cupures. Is this correct? (1 for yes, 0 for no)")

                if let confirmationInput = readLine(), let confirmation = Int(confirmationInput) {
                    switch confirmation {
                    case 1:
                        for _ in 0..<totalCupures {
                            print("Enter the value of the next cupure:(5, 10, 20, 50, or 100)")
                            if let value = readLine(), let value = Int(value), validCupures.contains(value) {
                                cupureCounts[value] = (cupureCounts[value] ?? 0) + 1
                            } else {
                                print("Invalid input. Please enter a valid cupure value (5, 10, 20, 50, or 100).")
                                return
                            }
                        }

                        // Calculate the total amount
                        let totalAmount = cupureCounts.reduce(0) { $0 + $1.key * $1.value }
                        print("\n💰 Deposit Summary 💰\n")

                        // Print the detailed bill
                        for (cupure, count) in cupureCounts {
                            print("\(count) x \(cupure) = \(count * cupure)")
                        }

                        print("\n💰 Total Amount Deposited: \(totalAmount) 💰\n")

                        // Add a decorative line
                        print("--------------------------------------------------")

                        // Thank you message with a visual touch
                        print("""
                        
                        Thank you for choosing us! 
                        
                        We hope to serve you again. 
                        
                        Software by Michael.M
                        
                        """)

                        break
                    case 0:
                        print("Please try again.")
                    default:
                        print("Operation canceled. Bye!")
                        print("""
                        
                        B   Y   E
                        B  Y  E
                        B Y  E
                        B  Y E
                        B   Y  E
                        
                        """)
                        return
                    }
                } else {
                    print("Invalid confirmation. Please enter a valid integer.")
                }
            } else {
                print("Invalid input. Please enter a positive integer for the total number of cupures.")
            }
        } while true
    }
}

// To use the class:
let terminal = BankTerminal()
terminal.processDeposit()

