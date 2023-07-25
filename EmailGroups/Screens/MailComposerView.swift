//
//  MailComposerView.swift
//  EmailGroups
//
//  Created by Samrez Ikram on 25/07/2023.
//

import Foundation
import SwiftUI
import MessageUI

struct MailComposerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let recipients: [String]

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isPresented: Bool

        init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailComposerView>) -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.setToRecipients(recipients)
        mailComposeVC.mailComposeDelegate = context.coordinator
        return mailComposeVC
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailComposerView>) {
    }
}
