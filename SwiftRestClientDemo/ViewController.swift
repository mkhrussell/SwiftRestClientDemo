//
//  ViewController.swift
//  SwiftRestClientDemo
//
//  Created by Kamrul Hasan on 15/12/19.
//  Copyright © 2019 Kamrul Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvUserInfo: UITextView!

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    private func loadData() {
        let client = TypicodeClient()
        client.fetchUser(id: 1) { (user) in
            if let user = user {
                DispatchQueue.main.async {
                    self.user = user
                    self.updateUI()
                }
            }
        }
    }

    private func updateUI() {
        guard let user = self.user else { return }

        let userInfo = """
            Id: \(user.id)
            Name: " \(user.name)
            Nickname: \(user.nickname)
            Email: \(user.email)
            Address:
                Street: \(user.address.street)
                Suite: \(user.address.suite)
                City: \(user.address.city)
                Zipcode: \(user.address.zipcode)
                Geo-location:
                    lat: \(user.address.geo.lat)
                    long: \(user.address.geo.long)
            Phone: \(user.phone)
            Website: \(user.website)
            Company:
                Name: \(user.company.name)
                Catch Phrase: \(user.company.catchPhrase)
                Business: \(user.company.business)
            """

        tvUserInfo.text = userInfo
    }

}

