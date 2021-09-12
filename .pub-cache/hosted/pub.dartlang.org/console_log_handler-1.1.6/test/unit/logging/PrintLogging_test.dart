/*
 * Copyright (c) 2015, Michael Mitterer (office@mikemitterer.at),
 * IT-Consulting and Development Limited.
 *
 * All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@TestOn("vm")
library console_log_handler.unit.test.console;

import 'package:test/test.dart';

import "package:console_log_handler/print_log_handler.dart";

main() {
    final Logger _logger = new Logger("unit.test.Logging");
    configLogging(show: Level.OFF);

    group('Logging', () {
        setUp(() {
        });

        test('> Map', () {
            final Map<String, dynamic> map = {
                "firstname" : "Mike", "lastname" : "Mitterer {{var}}", "family" : {
                    "daughter" : "Sarah", "age" : 18
                }
            };

            _logger.info("Hallo", map);
        });
        // end of 'Map' test

        test('> StackTrace', () {
            try {
                throw "Sample for exception";
            } on String catch( error, stacktrace) {

                _logger.severe("Caught error",error,stacktrace);
            }
        }); // end of 'StackTrace' test

    });
    // end 'Logging' group
}

